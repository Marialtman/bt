#ifdef CONFIG_CPLUSPLUS
	SECTION_PROLOGUE(_CTOR_SECTION_NAME,,)
	{
		/*
		 * The compiler fills the constructor pointers table below,
		 * hence symbol __CTOR_LIST__ must be aligned on 4 byte
		 * boundary.  To align with the C++ standard, the first elment
		 * of the array contains the number of actual constructors. The
		 * last element is NULL.
		 */
		. = ALIGN(4);
		__CTOR_LIST__ = .;
		LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
		KEEP(*(SORT_BY_NAME(".ctors*")))
		LONG(0)
		__CTOR_END__ = .;
	} GROUP_LINK_IN(ROMABLE_REGION)

	SECTION_PROLOGUE(init_array, (OPTIONAL),)
	{
		. = ALIGN(4);
		__init_array_start = .;
		KEEP(*(SORT_BY_NAME(".init_array*")))
		__init_array_end = .;
	} GROUP_LINK_IN(ROMABLE_REGION)
#endif

	SECTION_PROLOGUE (devconfig, (OPTIONAL),)
	{
		__devconfig_start = .;
		*(".devconfig.*")
		KEEP(*(SORT_BY_NAME(".devconfig*")))
		__devconfig_end = .;
	} GROUP_LINK_IN(ROMABLE_REGION)
	SECTION_PROLOGUE(initshell, (OPTIONAL),)
	{
		SHELL_INIT_SECTIONS()
	} GROUP_LINK_IN(ROMABLE_REGION)

	SECTION_PROLOGUE(net_l2, (OPTIONAL),)
	{
		__net_l2_start = .;
		*(".net_l2.init")
		KEEP(*(SORT_BY_NAME(".net_l2.init*")))
		__net_l2_end = .;
	} GROUP_LINK_IN(ROMABLE_REGION)


	SECTION_DATA_PROLOGUE(tracing_backends_sections,(OPTIONAL),)
	{
		_tracing_backend_list_start = .;
		KEEP(*("._tracing_backend.*"));
		_tracing_backend_list_end = .;
	} GROUP_LINK_IN(ROMABLE_REGION)
