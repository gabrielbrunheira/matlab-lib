function [] = custom_legend(ax,values,title)

leg = legend(split(num2str(values)));
title(leg,title);
leg.Title.Visible = 'on';