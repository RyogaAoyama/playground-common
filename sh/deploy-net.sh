ENV=$1
PROFILE=$2

if [ "${ENV}" = "" ];
then
  BIN_ENV=dev
fi

if [ "${PROFILE}" = "" ];
then
  BIN_ENV=default
fi

TEMPLATE_PATH='./cloudformation/Networks.yml'

# 環境変数をインポート
. ./cloudformation/config/parameters.txt

# デプロイ
rain deploy ${TEMPLATE_PATH} ${NETWORK_STACK_NAME} -y -p ${PROFILE} --params Env=${ENV},ServiceName=${SERVICE_NAME},SystemName=${SYSTEM_NAME}