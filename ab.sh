#!/bin/bash

SERVICE_IP=$(kubectl get svc express -o jsonpath='{.spec.clusterIP}')
PORT=30080

for i in {1..100}; do
  RESPONSE=$(curl -s http://127.0.0.1:$PORT)
  echo "Response $i: $RESPONSE"
done