% Bratko, Ivan. Prolog programming for artificial intelligence. 
%    3rd ed, p371.
%
% Belief network 'sensor'

parent(burglary, sensor).
parent(lightning, sensor).
parent(sensor, alarm).
parent(sensor, call).

p(burglary, 0.001).
p(lightning, 0.02).
p(sensor, [burglary, lightning], 0.9).
p(sensor, [burglary, no(lightning)], 0.9).
p(sensor, [no(burglary), lighting], 0.1).
p(sensor, [no(burglary), no(lighting)], 0.001).
p(alarm, [sensor], 0.95).
p(alarm, [no(sensor)], 0.001).
p(call, [sensor], 0.9).
p(call, [no(sensor)], 0.0).
