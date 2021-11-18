function symboles = create_OFDM_symboles(data)

    mappedSig = MapSig_vec(data);
    signal_paralell_ifft=ifft(mappedSig.',64).';
    cyclic = 16;
    signal_paralell_fft_cyclic=[signal_paralell_ifft(:,end-cyclic+1:end),signal_paralell_ifft];
    symboles = reshape(signal_paralell_fft_cyclic.',1,[]);
end