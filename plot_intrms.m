function [intrms_data,f_sel] = plot_intrms(data,fs)

flow = fs/length(data);

[intrms_data, f_sel] = intrms(data, fs, flow);

%loglog(f_sel, intrms_data/max(intrms_data));
loglog(f_sel, intrms_data);
grid on;
xlabel('Frequency [Hz]');
ylabel('Integrated spectrum');
set(gca,'FontSize',12)