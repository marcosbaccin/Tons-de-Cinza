#include <iostream>
#include <stdio.h>
#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "Inversa_CUDA.h"

using namespace std;
using namespace cv;

int main(){
    Mat Input_Imagem = imread("ney.png");
    cout << "Altura: " << Input_Imagem.rows << "Comprimento: " << Input_Imagem.cols
        << "Canais: " << Input_Imagem.channels() << endl;
    Imagem_Inversao_CUDA(Input_Imagem.data, Input_Imagem.rows,
        Input_Imagem.cols, Input_Imagem.channels());
    imwrite("NovoBCC8.png", Input_Imagem);
    system("pause");
    return 0;
}