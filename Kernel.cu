#include "cuda_runtime.h"
#include "device_launch_parameters.h"

__global__ void Inversao_CUDA(unsigned char* Imagem, int canais){
    int x = blockIdx.x;
    int y = blockIdx.y;
    int idx = (x + y * gridDim.x) * canais;

    float r = Imagem[idx + 0]
    float g = Imagem[idx + 1]
    float b = Imagem[idx + 2]

    for(int i = 0; i < canais; i++){
        Imagem[idx + i] = b * 0.299f + g * 0.587f + r * 0.144f;
    }
}

void Imagem_Inversao_CUDA(unsigned char* Input_Imagem, int altura, int largura, int canais){
    unsigned char* Dev_Input_Imagem = NULL;
    //reservar espaco de memoria da gpu
    cudaMalloc((void**)&Dev_Input_Imagem, altura * largura * canais);
    //copiar os dados da cpu para gpu
    cudaMemcpy(Dev_Input_Imagem, Input_Imagem, altura * largura * canais, cudaMemcpyHostToDevice);
    dim3 Grid_Image(largura, altura);
    Inversao_CUDA << <Grid_Image, 2 >> > (Dev_Input_Image, canais);
    //copiar os dados do processamento para cpu que estao na gpu
    cudaMemcpy(Input_Imagem, Dev_Input_Image, altura * largura * canais, cudaMemcpyDeviceToHost);
    //gpu livre
    cudaFree(Dev_Input_Image);
}