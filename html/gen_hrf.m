T   = 0.2;
HRF = spm_hrf(T);
figure; plot(HRF);

Labels = cellfun(@str2num, get(gca,'XTickLabel'));
set(gca,'XTickLabel',(Labels - Labels(1))*T);
xlabel('Post-stimulus Time (seconds)');