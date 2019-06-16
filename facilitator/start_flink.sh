cd beam/.test-infra/dataproc/

CLUSTER_NAME=flink \
GCS_BUCKET=gs://beam-summit-berlin-2019/flink-cluster \
HARNESS_IMAGES_TO_PULL='gcr.io/apache-beam-testing/beam_portability/python:latest' \
JOB_SERVER_IMAGE=gcr.io/apache-beam-testing/beam_portability/flink-job-server:latest \
ARTIFACTS_DIR=gs://beam-summit-berlin-2019 \
FLINK_DOWNLOAD_URL=http://archive.apache.org/dist/flink/flink-1.7.0/flink-1.7.0-bin-hadoop28-scala_2.12.tgz \
FLINK_NUM_WORKERS=2 \
FLINK_TASKMANAGER_SLOTS=1 \
DETACHED_MODE=false \
./create_flink_cluster.sh

