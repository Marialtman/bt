obj-$(CONFIG_SPI_FLASH_W25QXXDV) += spi_flash_w25qxxdv.o
obj-$(CONFIG_SOC_FLASH_QMSI) += soc_flash_qmsi.o
obj-$(CONFIG_SOC_FLASH_NRF5) += soc_flash_nrf5.o
obj-$(CONFIG_SOC_FLASH_MCUX) += soc_flash_mcux.o

obj-$(CONFIG_OUTSIDE_FLASH) += outsideflash.o

ifeq ($(CONFIG_SOC_SERIES_STM32F3X),y)
obj-$(CONFIG_SOC_FLASH_STM32) += flash_stm32f3x.o
obj-$(CONFIG_SOC_FLASH_STM32) += flash_stm32f3x_priv.o
endif

obj-$(CONFIG_XSPI_MEM_ACTS) += xspi_mem_acts.o
obj-$(CONFIG_XSPI_NOR_ACTS) += xspi_nor_acts.o 
obj-$(CONFIG_XSPI_PSRAM_ACTS) += xspi_psram_acts.o

obj-$(CONFIG_SPI_PSRAM_GENERAL_SPI) += spi_psram.o

ifeq ($(CONFIG_SOC_SERIES_STM32F4X),y)
obj-$(CONFIG_SOC_FLASH_STM32) += flash_stm32.o flash_stm32f4x.o
endif

ifeq ($(CONFIG_SOC_SERIES_STM32L4X),y)
obj-$(CONFIG_SOC_FLASH_STM32) += flash_stm32.o flash_stm32l4x.o
endif

ccflags-$(CONFIG_SOC_FLASH_NRF5_RADIO_SYNC) += -I${ZEPHYR_BASE}/subsys/bluetooth
