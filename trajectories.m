function trajectories()

ego_gt = importdata("./data/GTEgoCar.txt");
vehicle_poses = importdata("./data/4_50_198_2_mobili.txt");
base_ego = ego_gt(18,:);
r = base_ego(1:9);
R_ego = reshape(r, [3 3]);
t_ego = base_ego(10:12)';
T_base = [R_ego, t_ego; zeros(1,3) 1];
% poses = [reshape(R', [1 9], t'];
ego_motion = [];
vehicle_motion = [];
for i=1:size(ego_gt,1)
    current_ego = ego_gt(i,:);
    r_ego = current_ego(1:9);
    R_ego = reshape(r_ego, [3 3]);
    t_ego = current_ego(10:12)';
    T_curr = [R_ego t_ego; zeros(1,3) 1];
%     T_ego = inv(T_base) * T_curr;
    T_ego = T_curr;
    ego_motion = [ego_motion; reshape(T_ego(1:3,1:3)', [1 9]), T_ego(1:3,4)'];
%     current_vehicle = vehicle_poses(i-17,:);
    current_vehicle = vehicle_poses(i,:); % modification
    r_vehicle = current_vehicle(1:9);
    R_vehicle = reshape(r_vehicle, [3 3])';
    t_vehicle = current_vehicle(10:12)';
    T_vehicle = [R_vehicle t_vehicle; zeros(1,3) 1];
    T_final = T_ego * T_vehicle;
    vehicle_motion = [vehicle_motion; reshape(T_final(1:3,1:3)', [1 9]), T_final(1:3,4)'];
end
% system("rm 4_ego_17-43.txt 4_2_17-43.txt");
% writematrix(ego_motion, "4_ego_17-43.txt", "Delimiter", "space");
writematrix(vehicle_motion, "4_2_50-198.txt", "Delimiter", "space");
plot(ego_motion(:,10), ego_motion(:,12), "g", vehicle_motion(:,10), vehicle_motion(:,12), "r");

end

