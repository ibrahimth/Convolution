
itr = 200;
t = linspace(-1,1,fs);


convolution      = zeros(1,length(t));

set(gcf,'Color',[1 1 1]);
ax = [-1 1 -0.3 1.2];    


y1 = rectpuls(t,1);
y2 = tripuls(t,0.5,-1);

subplot(4,2,1);plot(t,y1,'Color','blue','LineWidth',2),axis(ax); 
grid on;
xlabel('t')

 title('	 f(t)')
subplot(4,2,2);plot(t,y2,'Color','red','LineWidth',2),axis(ax); 
grid on;
xlabel('t')

 title('	 g(t)')

% ========== convolution of y1 and y2:
sprintf('\n\nConvolution of two signals (y1 and y2):');

for i = 1:itr
    moveStep = (2*i-fs)/fs;
    y2_shifted = tripuls(-(t-moveStep),0.5,-1);
    convolution(i) = trapz(t, y1.*y2_shifted);
    
    subplot(4,2,3:4)
    hold off;
    plot(t,y1,'Color','blue','LineWidth',2),axis(ax);
    hold on; 
    plot(t,y2_shifted,'Color','red' ,'LineWidth',2),axis(ax);
    grid on;
    xlabel('t');
     title('	Shifting  by t ')
   
    subplot(4,2,7:8)
    hold off
    plot(t(1:i),convolution(1:i),'Color','black','LineWidth',2); axis([-1 1 -0.2 0.5]);
    grid on;
    xlabel('t')
    title('Convolution f(t) * g(t) ')
    
    pause(0.01)
end