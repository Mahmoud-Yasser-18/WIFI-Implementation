function mappedSig = MapSig_vec(data)
% disp(length(data));
mappedSig = zeros(length(data)/48,64);
X=reshape(data,[48,length(data)/48 ]).';
mappedSig(:,39:43) = X(:,1:5);
mappedSig(:,45:57) = X(:,6:18);
mappedSig(:,59:64) = X(:,19:24);
mappedSig(:,2:7) = X(:,25:30);
mappedSig(:,9:21) = X(:,31:43);
mappedSig(:,23:27) = X(:,44:48);
mappedSig(:,44) =1;
mappedSig(:,22) =-1;
mappedSig(:,58) =1;
mappedSig(:,8) =1;
end