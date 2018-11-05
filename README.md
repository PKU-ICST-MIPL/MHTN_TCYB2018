# Introduction
This is the source code of our IEEE TCYB 2018 paper "MHTN: Modal-adversarial Hybrid Transfer Network for Cross-modal Retrieval", Please cite the following paper if you use our code.

Xin Huang, Yuxin Peng, and Mingkuan Yuan, "MHTN: Modal-adversarial Hybrid Transfer Network for Cross-modal Retrieval", IEEE Transactions on Cybernetics (TCYB), 2018. [[PDF]](http://59.108.48.34/tiki/download_paper.php?fileId=201828)

# Content
1. model.prototxt: network architecture of training stage
2. solver.prototxt: network solver
3. test.prototxt: network architecture of testing stage
4. Evaluate: Test codes for generating MAP scores


# Usage
1. Setup transfer-caffe  
Setup transfer-caffe from the following URL: https://github.com/zhuhan1236/transfer-caffe

2. Setup caffe-grl
Setup caffe-grl from the following URL: https://github.com/ddtm/caffe/tree/grl

3. Data Preparation (Taking PKU XMedia as example)  
   According to model.prototxt, you need:
   1. Source domain(ImageNet-ILSVRC2010): images folder, and list in .txt format (including label). Each line of List is in the format as "filepath label" like "n04347754_15004.JPEG 833".
   2. Data and class labels of target domain(PKU XMedia):
   
      a. for Image: images folder, and list in .txt format(including class labels). Each line of List is in the format as "filepath class_label" like "19_piano/84.jpg 18".

      b. for Text, Audio, Video, and 3D model: feature and label, in .lmdb format. Each entry of lmdb includes a feature vector and its label.
   3. One-hot modality labels of target domain(PKU XMedia): the list in .txt format(including one-hot modality labels) under the subfolder "one-hot". The size of this list is (sample number, modality number).
   For image sample, the one-hot modality label is "1 0 0 0 0".

   For text sample, the one-hot modality label is "0 1 0 0 0".

   For audio sample, the one-hot modality label is "0 0 1 0 0".

   For video sample, the one-hot modality label is "0 0 0 1 0".

   For 3D model sample, the one-hot modality label is "0 0 0 0 1".

4. Training  
 Train network with solver.prototxt and Pre-train model [AlexNet/alexnet_cvgj_wiki.caffemodel](http://www.icst.pku.edu.cn/mipl/tiki-download_file.php?fileId=1005). Remember to set your paths in model/test.prototxt and solver.prototxt

5. Testing  
   1. Extract common representation with test.prototxt (E.g. img_prob or txt_prob).  
   2. Compute MAP scores with extracted representations with Evaluate/evaluate_xmedia.m. Note: we set an exapmle Label.mat file in this folder. You must create yourselves to match the labels of your test data.

PKU XMedia dataset can be downloaded via: http://www.icst.pku.edu.cn/mipl/xmedia/


# Our Related Work
If you are interested in cross-media retrieval, you can check our recently published overview paper on IEEE TCSVT:

Yuxin Peng, Xin Huang, and Yunzhen Zhao, "An Overview of Cross-media Retrieval: Concepts, Methodologies, Benchmarks and Challenges", IEEE Transactions on Circuits and Systems for Video Technology (TCSVT), 28(9):2372-2385, 2018.[[PDF]](http://www.icst.pku.edu.cn/mipl/tiki-download_file.php?fileId=376)

Welcome to our [Benchmark Website](http://www.icst.pku.edu.cn/mipl/xmedia) and [Laboratory Homepage](http://www.icst.pku.edu.cn/mipl) for more information about our papers, source codes, and datasets.

