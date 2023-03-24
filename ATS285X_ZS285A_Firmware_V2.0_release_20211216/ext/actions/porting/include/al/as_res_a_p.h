#ifndef _RES_FINE_TUNE_H_
#define _RES_FINE_TUNE_H_

typedef struct {
	int channel;//0-left channel, 1-right channel
	int mode;  //1?è?á????ê¨o? 0--2?|ì?????ê? 1--?¨°¨|???é|ì???ê?  2--?¨°????é|ì??.
	int insample_rate;// 输入码流采样率 ，只支持44100, 或48000.
	int outsample_rate;// 输出码流采样率 ，只支持44100, 或48000.
	int in_samp;	//¨o?¨¨??¨′|ì???¨oy?ê?¨°a?¨?D?¨?¨2256???¨′|ì?.
	int out_samp;
	short *input_buf;
	short *output_buf;
	unsigned char *shared_buf;
	int shared_size;

}as_res_finetune_params;

typedef enum
{
    RES_FINETUNE_CMD_OPEN = 0,
    RES_FINETUNE_CMD_CLOSE,
    RES_FINETUNE_CMD_PROCESS,
	RES_FINETUNE_CMD_MEMORY,

} as_res_finetune_ops_cmd_t;

int as_res_finetune_ops(void *hnd, int cmd, unsigned int args);

/*
void main()
{
	unsigned char *inbuf, *outbuf;
	as_res_finetune_params param;
	int handle = 0;
	int rt;


	//¨|¨o??param.shared_buf
	memset(&param, 0, sizeof(as_res_finetune_params));
	param.mode = 2;//1:up  2 down
	param.sample_rate = 48000;//44100 or 48000
	param.in_samp = 128;//max is 256
	rt = as_res_finetune_ops(&handle, RES_FINETUNE_CMD_MEMORY, &param);
	param.shared_buf = (unsigned char *)malloc(param.shared_size);
	memset(param.shared_buf, 0, param.shared_size);


	//??¨°?a¨|¨¨?à?,3?¨o???￥
	rt = as_res_finetune_ops(&handle, RES_FINETUNE_CMD_OPEN, &param);


	while (1)
	{
		//read data to inbuf
	  //left channel
		param.channel = 0;//0-left , 1-right channel
		param.input_buf = inbuf;
		param.output_buf = outbuf;
		rt = as_res_finetune_ops(handle, RES_FINETUNE_CMD_PROCESS, &param);

		//read data to inbuf
		//right channel
		param.channel = 1;//0-left , 1-right channel
		param.input_buf = inbuf;
		param.output_buf = outbuf;
		rt = as_res_finetune_ops(handle, RES_FINETUNE_CMD_PROCESS, &param);

	}

	as_res_finetune_ops(handle, RES_FINETUNE_CMD_CLOSE, 0);



}

}*/


#endif
