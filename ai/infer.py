"""Inferência on-device com modelo convertido para TFLite."""
from __future__ import annotations

from typing import List

import numpy as np

try:
  import tflite_runtime.interpreter as tflite
except ImportError:  # pragma: no cover
  import tensorflow.lite as tflite  # type: ignore


class FoodDetection:
  def __init__(self, label: str, confidence: float, bbox: List[float]):
    self.label = label
    self.confidence = confidence
    self.bbox = bbox

  def to_dict(self) -> dict:
    return {"label": self.label, "confidence": self.confidence, "bbox": self.bbox}


def run_inference(model_path: str, image: np.ndarray, score_threshold: float = 0.35) -> List[FoodDetection]:
  """Executa inferência com modelo TFLite."""
  interpreter = tflite.Interpreter(model_path=model_path)
  interpreter.allocate_tensors()
  input_details = interpreter.get_input_details()[0]
  output_details = interpreter.get_output_details()

  resized = np.expand_dims(image, axis=0).astype(np.float32)
  interpreter.set_tensor(input_details['index'], resized)
  interpreter.invoke()

  boxes = interpreter.get_tensor(output_details[0]['index'])[0]
  scores = interpreter.get_tensor(output_details[2]['index'])[0]
  classes = interpreter.get_tensor(output_details[1]['index'])[0].astype(int)

  detections: List[FoodDetection] = []
  for bbox, score, cls in zip(boxes, scores, classes):
    if score < score_threshold:
      continue
    detections.append(FoodDetection(label=str(cls), confidence=float(score), bbox=bbox.tolist()))
  return detections


__all__ = ["FoodDetection", "run_inference"]
