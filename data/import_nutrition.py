"""Script para importar dados nutricionais TACO e USDA para o Firestore."""
from __future__ import annotations

import csv
from pathlib import Path
from typing import Dict, Iterable

import firebase_admin
from firebase_admin import credentials, firestore

TACO_HEADERS = {
    'energy_kcal': 'Energia (kcal)',
    'protein_g': 'Proteína (g)',
    'carb_g': 'Carboidrato (g)',
    'fat_g': 'Lipídeos (g)',
    'fiber_g': 'Fibra alimentar (g)',
}


def load_csv(path: Path) -> Iterable[Dict[str, str]]:
    with path.open(newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile, delimiter=';')
        for row in reader:
            yield row


def normalize_taco(row: Dict[str, str]) -> Dict[str, float | str]:
    return {
        'name': row['Descrição do Alimento'],
        'source': 'TACO',
        'portion_grams': float(row.get('Porção (g)', '100') or 100),
        'nutrients': {
            key: float(row.get(header, '0').replace(',', '.') or 0)
            for key, header in TACO_HEADERS.items()
        },
    }


def upload(collection: str, rows: Iterable[Dict[str, str]], normalizer) -> None:
    cred = credentials.ApplicationDefault()
    firebase_admin.initialize_app(cred)
    db = firestore.client()

    batch = db.batch()
    for idx, row in enumerate(rows):
        doc = normalizer(row)
        ref = db.collection(collection).document()
        batch.set(ref, doc)
        if (idx + 1) % 400 == 0:
            batch.commit()
            batch = db.batch()
    batch.commit()


if __name__ == '__main__':
    taco_path = Path('datasets/TACO_4a_ed.csv')
    upload('foods_br', load_csv(taco_path), normalize_taco)
    print('Importação TACO concluída. Para USDA, utilize API pública e respeite termos de uso (USDA FoodData Central).')
