deps_config := \
	/home/simha/esp/esp-idf/components/app_trace/Kconfig \
	/home/simha/esp/esp-idf/components/aws_iot/Kconfig \
	/home/simha/esp/esp-idf/components/bt/Kconfig \
	/home/simha/esp/esp-idf/components/driver/Kconfig \
	/home/simha/esp/esp-idf/components/esp32/Kconfig \
	/home/simha/esp/esp-idf/components/esp_adc_cal/Kconfig \
	/home/simha/esp/esp-idf/components/esp_event/Kconfig \
	/home/simha/esp/esp-idf/components/esp_http_client/Kconfig \
	/home/simha/esp/esp-idf/components/esp_http_server/Kconfig \
	/home/simha/esp/esp-idf/components/ethernet/Kconfig \
	/home/simha/esp/esp-idf/components/fatfs/Kconfig \
	/home/simha/esp/esp-idf/components/freemodbus/Kconfig \
	/home/simha/esp/esp-idf/components/freertos/Kconfig \
	/home/simha/esp/esp-idf/components/heap/Kconfig \
	/home/simha/esp/esp-idf/components/libsodium/Kconfig \
	/home/simha/esp/esp-idf/components/log/Kconfig \
	/home/simha/esp/esp-idf/components/lwip/Kconfig \
	/home/simha/esp/esp-idf/components/mbedtls/Kconfig \
	/home/simha/esp/esp-idf/components/mdns/Kconfig \
	/home/simha/esp/esp-idf/components/mqtt/Kconfig \
	/home/simha/esp/esp-idf/components/nvs_flash/Kconfig \
	/home/simha/esp/esp-idf/components/openssl/Kconfig \
	/home/simha/esp/esp-idf/components/pthread/Kconfig \
	/home/simha/esp/esp-idf/components/spi_flash/Kconfig \
	/home/simha/esp/esp-idf/components/spiffs/Kconfig \
	/home/simha/esp/esp-idf/components/tcpip_adapter/Kconfig \
	/home/simha/esp/esp-idf/components/unity/Kconfig \
	/home/simha/esp/esp-idf/components/vfs/Kconfig \
	/home/simha/esp/esp-idf/components/wear_levelling/Kconfig \
	/home/simha/esp/esp-idf/components/bootloader/Kconfig.projbuild \
	/home/simha/esp/esp-idf/components/esptool_py/Kconfig.projbuild \
	/home/simha/esp/esp-idf/components/partition_table/Kconfig.projbuild \
	/home/simha/esp/esp-idf/Kconfig

include/config/auto.conf: \
	$(deps_config)

ifneq "$(IDF_TARGET)" "esp32"
include/config/auto.conf: FORCE
endif
ifneq "$(IDF_CMAKE)" "n"
include/config/auto.conf: FORCE
endif

$(deps_config): ;
