function set_plot_text(str,ax, xperc,yperc)

xl = xlim(ax);
yl = ylim(ax);

xWidth = xl(2)-xl(1);
yHeight = yl(2)-yl(1);
x = xl(1) + xperc * xWidth;
y = yl(1) + yperc * yHeight;

text(ax, x, y, str,'HorizontalAlignment', 'center');