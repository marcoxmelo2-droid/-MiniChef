"""Treinamento do modelo YOLOv8 para detecção de alimentos brasileiros."""

from pathlib import Path

from ultralytics import YOLO


def train(data_yaml: str = 'configs/dataset.yaml', epochs: int = 80, img_size: int = 640) -> None:
    """Executa fine-tuning do YOLOv8 small com dados anotados."""
    model = YOLO('yolov8s.pt')
    model.train(
        data=data_yaml,
        epochs=epochs,
        imgsz=img_size,
        batch=16,
        patience=15,
        device='auto',
        project='runs/minicheff',
        name='yolov8s-food-br',
        cache=True,
    )


def export(model_path: str, export_format: str = 'onnx') -> Path:
    """Exporta modelo treinado para ONNX ou TFLite."""
    model = YOLO(model_path)
    output = model.export(format=export_format, dynamic=False, simplify=True)
    return Path(output)


if __name__ == '__main__':
    train()
