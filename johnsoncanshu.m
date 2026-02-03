function [meann, sigma, sk, k] = johnsoncanshu(x)
% JOHNSONCANSHU 计算二维表面的统计参数
% 输入:
%   x - 1024x1024 (或其他尺寸) 的表面高度矩阵
% 输出:
%   meann - 算术平均值 (Mean Height)
%   sigma - 均方根粗糙度/标准差 (Sq / RMS)
%   sk    - 偏度 (Skewness, Ssk)
%   k     - 峰度 (Kurtosis, Sku)

    % 1. 极其重要：将二维矩阵转换为一维列向量
    % 这样统计函数才是针对"整个面"计算，而不是针对"每一列"计算
    x = x(:);
    
    % 2. (可选) 剔除 NaN 值，防止计算结果为 NaN
    % 如果您的矩阵保证没有空值，这行可以注释掉以提高极微小的速度
    x(isnan(x)) = [];

    % 3. 计算统计参数
    meann = mean(x);      % 计算整体均值
    sigma = std(x);       % 计算整体标准差 (对应粗糙度 Sq)
    sk = skewness(x);     % 计算整体偏度
    k = kurtosis(x);      % 计算整体峰度 (MATLAB定义的正态分布峰度为3)

end