const { NodeSDK } = require('@opentelemetry/sdk-node');
const { getNodeAutoInstrumentations } = require('@opentelemetry/auto-instrumentations-node');
const { OTLPTraceExporter } = require('@opentelemetry/exporter-trace-otlp-http');
const { OTLPLogExporter } = require('@opentelemetry/exporter-logs-otlp-http');

const traceExporter = new OTLPTraceExporter({ url: 'http://localhost:4318/v1/traces' });
const logExporter = new OTLPLogExporter({ url: 'http://localhost:4318/v1/logs' });

const sdk = new NodeSDK({
  traceExporter,
  instrumentations: [getNodeAutoInstrumentations()],
});

sdk.start()
  .then(() => console.log('OpenTelemetry initialized'))
  .catch((error) => console.log('OTel error:', error));
