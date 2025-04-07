function [intrms_data,f_sel] = plot_intrms(data, fs, unit, plot_type)

if nargin < 3 || isempty(unit)
    unit = "unit";
end
if nargin < 4 || isempty(plot_type)
    plot_type = "loglog";
end

flow = fs/length(data);

[intrms_data, f_sel] = intrms(data(:), fs, flow);

if plot_type == "loglog"
    loglog(f_sel, intrms_data);
elseif plot_type == "semilogx"
    semilogx(f_sel, intrms_data);
elseif plot_type == "semilogy"
    semilogy(f_sel, intrms_data);
elseif plot_type == "linear"
    plot(f_sel, intrms_data);
else
    loglog(f_sel, intrms_data);
end

grid on;
xlabel('Frequency [Hz]');
ylabel(sprintf("Cum. Amplitude Spectrum [%s-rms]", unit));
set(gca,'FontSize',12)