function [intrms_data,f_sel] = plot_cps(data, fs, unit, plot_type)

if nargin < 3 || isempty(unit)
    unit = "unit";
end
if nargin < 4 || isempty(plot_type)
    plot_type = "loglog";
end

flow = fs/length(data);
fhigh = Inf;

window = rectwin(floor(size(data,1)));
noverlap = floor(0.5*length(window));
nfft = length(window);

[cps_data, f_sel] = psdrms(data, fs, flow, fhigh, window, noverlap, nfft, "power");

if plot_type == "loglog"
    loglog(f_sel, cps_data);
elseif plot_type == "semilogx"
    semilogx(f_sel, cps_data);
elseif plot_type == "semilogy"
    semilogy(f_sel, cps_data);
elseif plot_type == "linear"
    plot(f_sel, cps_data);
else
    loglog(f_sel, cps_data);
end

grid on;
xlabel('Frequency [Hz]');
ylabel(sprintf("Cum. Power Spectrum [%s^2]", unit));
set(gca,'FontSize',12)