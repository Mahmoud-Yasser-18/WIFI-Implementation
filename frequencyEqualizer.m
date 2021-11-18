function equalized = frequencyEqualizer(data, H, type, SNR)

switch type
    case 'ZF'
        equalized = data./H;
    case 'Weiner'
        equalized = data .* (conj(H)./(abs(H).^2+ (1/SNR)));
end
end