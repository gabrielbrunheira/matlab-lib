function [r,t] = generate_ramps(ramp, amp, fs_ramp, num_cycles)

ts_ramp = 1/fs_ramp;
r = [];
r_final_10ms = ramp(end)*ones(1,0.01*fs_ramp);

for i = 1:num_cycles
    r = [r amp*ramp r_final_10ms];
end

t = (0:length(r))*ts_ramp;
t = t(1:end-1);
