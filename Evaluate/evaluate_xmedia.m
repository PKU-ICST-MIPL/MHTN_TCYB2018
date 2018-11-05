%% ----------Initialization------------
%Load labels of test set
load('Label');

%% -------------------Search Task Definition(XMedia)-----------------------
%Load shared representations
I = importdata('img_prob\feature.txt'); 
T = importdata('txt_prob\feature.txt');
V = importdata('vid_prob\feature.txt');
A = importdata('aud_prob\feature.txt');
TD = importdata('3d_prob\feature.txt');

I = I(1:500, :);
T = T(1:500, :);
A = A(1:100, :);
V = V(vidIndex, :);
V = V(1:50, :);
TD = TD(1:50, :);

ImgCat = ImgCat(1:500, :);
TxtCat = TxtCat(1:500, :);
AudCat = AudCat(1:100, :);
VidCat = VidCat(1:50, :);
TDCat = TDCat(1:50, :);

WIT = getW(I, T);
WIV = getW(I, V);
WIA = getW(I, A);
WITD = getW(I, TD);
WTV = getW(T, V);
WTA = getW(T, A);
WTTD = getW(T, TD);
WVA = getW(V, A);
WVTD = getW(V, TD);
WATD = getW(A, TD);

% Image->Text
QryonTestBi(WIT, ImgCat, TxtCat);
% Text->Image
QryonTestBi(WIT', TxtCat, ImgCat);

% Image->Video
QryonTestBi(WIV, ImgCat, VidCat);
% Video->Image
QryonTestBi(WIV', VidCat, ImgCat);

% Image->Audio
QryonTestBi(WIA, ImgCat, AudCat);
% Audio->Image
QryonTestBi(WIA', AudCat, ImgCat);

% Image->3D
QryonTestBi(WITD, ImgCat, TDCat);
% 3D->Audio
QryonTestBi(WITD', TDCat, ImgCat);

% Text->Video
QryonTestBi(WTV, TxtCat, VidCat);
QryonTestBi(WTV', VidCat, TxtCat);

% Text->Audio
QryonTestBi(WTA, TxtCat, AudCat);
% Audio->Text
QryonTestBi(WTA', AudCat, TxtCat);

% Text->3D
QryonTestBi(WTTD, TxtCat, TDCat);
% 3D->Audio
QryonTestBi(WTTD', TDCat, TxtCat);

% Video->Audio
QryonTestBi(WVA, VidCat, AudCat);
% Audio->Video
QryonTestBi(WVA', AudCat, VidCat);

% Video->3D
QryonTestBi(WVTD, VidCat, TDCat);
% 3D->Audio
QryonTestBi(WVTD', TDCat, VidCat);

% Audio->3D
QryonTestBi(WATD, AudCat, TDCat);
% 3D->Audio
QryonTestBi(WATD', TDCat, AudCat);
