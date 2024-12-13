#!/bin/bash

cyan='\033[0;36m'
blue='\033[0;34m'
nocol='\033[0m'

clear

crave clone create --projectID 72 /crave-devspaces/los

cd /crave-devspaces/los

echo -e "$cyan***********************************************"
echo -e "       BUILDING ROM with Bomb ass command          "
echo -e "***********************************************$nocol"

# Run inside foss.crave.io devspace, in the project folder
# Remove existing local_manifests
crave run --no-patch -- "rm -rf .repo/local_manifests/ packages; \
repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs; \
git clone https://github.com/MI8953-Project/local_manifests -b ysl-4.19 .repo/local_manifests; \
/opt/crave/resync.sh; \
git clone https://github.com/MI8953-Project/android_device_qcom_sepolicy_mithorium -b lineage-20.0-legacy-um device/qcom/sepolicy-legacy-um_mithorium; \
. build/envsetup.sh; \
export ALLOW_MISSING_DEPENDENCIES=TRUE; \
lunch lineage_ysl_4_19-userdebug; \
make installclean; \
export TZ=Asia/Jakarta; \
m bacon"
