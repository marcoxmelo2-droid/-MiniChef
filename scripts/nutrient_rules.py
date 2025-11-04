"""Regras simplificadas de nutrição por faixa etária."""
from __future__ import annotations

from dataclasses import dataclass
from enum import Enum
from typing import Dict


class AgeRange(Enum):
    SIX_TO_TWELVE_MONTHS = '6-12m'
    ONE_TO_THREE_YEARS = '1-3a'
    FOUR_TO_SIX_YEARS = '4-6a'
    SEVEN_TO_TEN_YEARS = '7-10a'


@dataclass(frozen=True)
class NutrientTargets:
    calories: int
    protein_g: int
    carbs_g: int
    fat_g: int
    fiber_g: int


TARGETS: Dict[AgeRange, NutrientTargets] = {
    AgeRange.SIX_TO_TWELVE_MONTHS: NutrientTargets(900, 15, 120, 30, 10),
    AgeRange.ONE_TO_THREE_YEARS: NutrientTargets(1200, 30, 150, 40, 14),
    AgeRange.FOUR_TO_SIX_YEARS: NutrientTargets(1500, 40, 180, 50, 18),
    AgeRange.SEVEN_TO_TEN_YEARS: NutrientTargets(1800, 55, 210, 60, 25),
}


ALERT_RULES = {
    'sugar_ultra': lambda grams: grams > 20,
    'protein_low': lambda grams, target: grams < target * 0.75,
    'fiber_low': lambda grams, target: grams < target * 0.7,
}


def evaluate_intake(age: AgeRange, total_calories: float, protein: float, fiber: float, sugar_ultra: float) -> Dict[str, bool]:
    target = TARGETS[age]
    return {
        'calories_ok': 0.85 * target.calories <= total_calories <= 1.15 * target.calories,
        'protein_low': ALERT_RULES['protein_low'](protein, target.protein_g),
        'fiber_low': ALERT_RULES['fiber_low'](fiber, target.fiber_g),
        'sugar_ultra_high': ALERT_RULES['sugar_ultra'](sugar_ultra),
    }


__all__ = ['AgeRange', 'NutrientTargets', 'TARGETS', 'evaluate_intake']
