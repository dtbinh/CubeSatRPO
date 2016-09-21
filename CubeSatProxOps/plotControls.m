function plotControls(sat,scenario)
t = 0:scenario.dt:scenario.t;
tf = scenario.t;

figure
subplot(3,3,1)
hold on
stairs(t,sat.ux/sat.umax,'-b','linewidth',2)
plot([0 tf],[0 0],'--k','linewidth',2)
axis([0 tf -1.5 1.5])
grid on
title('Control Signals vs Time')
ylabel('ux')

subplot(3,3,4)
hold on
stairs(t,sat.uy/sat.umax,'-r','linewidth',2)
plot([0 tf],[0 0],'--k','linewidth',2)
axis([0 tf -1.5 1.5])
grid on
ylabel('uy')

subplot(3,3,7)
hold on
stairs(t,sat.uz/sat.umax,'-g','linewidth',2)
plot([0 tf],[0 0],'--k','linewidth',2)
axis([0 tf -1.5 1.5])
grid on
xlabel('Time [s]')
ylabel('uz')

% Velocity
subplot(3,3,2)
plot(t,sat.vx,'-b','linewidth',2)
axis([0 tf 0 1],'auto y')
grid on
ylabel('Vx [m/s]')
title('Velocity vs Time')

subplot(3,3,5)
plot(t,sat.vy,'-r','linewidth',2)
axis([0 tf 0 1],'auto y')
grid on
ylabel('Vy [m/s]')

subplot(3,3,8)
plot(t,sat.vz,'-g','linewidth',2)
axis([0 tf 0 1],'auto y')
grid on
xlabel('Time [s]')
ylabel('Vz [m/s]')

% Position
subplot(3,3,3)
plot(t,sat.x,'-b','linewidth',2)
axis([0 tf 0 1],'auto y')
grid on
ylabel('x [m]')
title('Position vs Time')

subplot(3,3,6)
plot(t,sat.y,'-r','linewidth',2)
axis([0 tf 0 1],'auto y')
grid on
ylabel('y [m]')

subplot(3,3,9)
plot(t,sat.z,'-g','linewidth',2)
axis([0 tf 0 1],'auto y')
grid on
xlabel('Time [s]')
ylabel('z [m]')

figure
hold on
plot(t,sat.wb1,'-b','linewidth',2)
plot(t,sat.wb2,'-r','linewidth',2)
plot(t,sat.wb3,'-g','linewidth',2)
hold off
axis([0 tf 0 1],'auto y')
grid on
legend({'\omega1','\omega2','\omega3'})
xlabel('Time, t')
ylabel('Angular Velocity, rad/s')
title('Angular Velocity vs Time')

% figure
% hold on
% plot(t,sat.th1,'-b','linewidth',2)
% plot(t,sat.th2,'-r','linewidth',2)
% plot(t,sat.th3,'-g','linewidth',2)
% hold off
% axis([0 tf 0 1],'auto y')
% grid on
% legend({'\omega1','\omega2','\omega3'})
% xlabel('Time, t')
% ylabel('Angular Velocity, rad/s')
% title('Angular Velocity vs Time')

figure
hold on
plot(t,sat.q1,'-b','linewidth',2)
plot(t,sat.q2,'-r','linewidth',2)
plot(t,sat.q3,'-g','linewidth',2)
plot(t,sat.q4,'-k','linewidth',2)
hold off
axis([0 tf 0 1],'auto y')
grid on
xlabel('Time [s]')
ylabel('Quaternions')
legend({'q1','q2','q3','q4'})
title('Attitude Quaternions vs Time')
end