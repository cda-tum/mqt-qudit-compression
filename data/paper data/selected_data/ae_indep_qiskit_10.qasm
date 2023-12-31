OPENQASM 2.0;
include "qelib1.inc";
qreg eval[9];
qreg q[1];
creg meas[10];
u2(0,-pi) eval[0];
u2(0,-pi) eval[1];
u2(0,-pi) eval[2];
u2(0,-pi) eval[3];
u2(0,-pi) eval[4];
u2(0,-pi) eval[5];
u2(0,-pi) eval[6];
u2(0,-pi) eval[7];
u2(0,-pi) eval[8];
u3(0.64350111,0,-pi) q[0];
cz eval[0],q[0];
u3(0.92729522,0,0) q[0];
cz eval[0],q[0];
u3(0.92729522,-pi,-pi) q[0];
u1(-1.5646604) eval[0];
cz eval[1],q[0];
u3(1.8545904,0,0) q[0];
cz eval[1],q[0];
u3(1.8545904,-pi,-pi) q[0];
u1(-1.5585245) eval[1];
cz eval[2],q[0];
u3(2.5740044,-pi,-pi) q[0];
cz eval[2],q[0];
u3(2.5740044,0,0) q[0];
u1(-1.5462526) eval[2];
cz eval[3],q[0];
u3(1.1351764,0,0) q[0];
cz eval[3],q[0];
u3(1.1351764,-pi,-pi) q[0];
u1(-1.5217089) eval[3];
cz eval[4],q[0];
u3(2.2703524,0,0) q[0];
cz eval[4],q[0];
u3(2.2703529,-pi,-pi) q[0];
u1(-1.4726216) eval[4];
cz eval[5],q[0];
u3(1.7424795,-pi,-pi) q[0];
cz eval[5],q[0];
u3(1.7424796,0,0) q[0];
u1(-7*pi/16) eval[5];
cz eval[6],q[0];
u3(2.7982262,0,0) q[0];
cz eval[6],q[0];
u3(2.7982262,-pi,-pi) q[0];
u1(-3*pi/8) eval[6];
cz eval[7],q[0];
u3(0.68673084,-pi,-pi) q[0];
cz eval[7],q[0];
u3(0.68673293,0,0) q[0];
u1(-pi/4) eval[7];
cz eval[8],q[0];
u3(1.3734617,-pi,-pi) q[0];
cz eval[8],q[0];
u3(0.19733465,0,-pi) q[0];
cz eval[7],eval[8];
u3(pi/4,-pi/2,pi/2) eval[8];
cz eval[7],eval[8];
u3(pi/4,pi/2,-pi/2) eval[8];
cz eval[6],eval[8];
u3(pi/8,-pi/2,pi/2) eval[8];
cz eval[6],eval[8];
cz eval[6],eval[7];
u3(pi/4,-pi/2,pi/2) eval[7];
cz eval[6],eval[7];
u3(pi/4,pi/2,-pi/2) eval[7];
u3(pi/8,pi/2,-pi/2) eval[8];
cz eval[5],eval[8];
u3(pi/16,-pi/2,pi/2) eval[8];
cz eval[5],eval[8];
cz eval[5],eval[7];
u3(pi/8,-pi/2,pi/2) eval[7];
cz eval[5],eval[7];
cz eval[5],eval[6];
u3(pi/4,-pi/2,pi/2) eval[6];
cz eval[5],eval[6];
u3(pi/4,pi/2,-pi/2) eval[6];
u3(pi/8,pi/2,-pi/2) eval[7];
u3(pi/16,pi/2,-pi/2) eval[8];
cz eval[4],eval[8];
u3(pi/32,-pi/2,pi/2) eval[8];
cz eval[4],eval[8];
cz eval[4],eval[7];
u3(pi/16,-pi/2,pi/2) eval[7];
cz eval[4],eval[7];
cz eval[4],eval[6];
u3(pi/8,-pi/2,pi/2) eval[6];
cz eval[4],eval[6];
cz eval[4],eval[5];
u3(pi/4,-pi/2,pi/2) eval[5];
cz eval[4],eval[5];
u3(pi/4,pi/2,-pi/2) eval[5];
u3(pi/8,pi/2,-pi/2) eval[6];
u3(pi/16,pi/2,-pi/2) eval[7];
u3(pi/32,pi/2,-pi/2) eval[8];
cz eval[3],eval[8];
u3(pi/64,-pi/2,pi/2) eval[8];
cz eval[3],eval[8];
cz eval[3],eval[7];
u3(pi/32,-pi/2,pi/2) eval[7];
cz eval[3],eval[7];
cz eval[3],eval[6];
u3(pi/16,-pi/2,pi/2) eval[6];
cz eval[3],eval[6];
cz eval[3],eval[5];
u3(pi/8,-pi/2,pi/2) eval[5];
cz eval[3],eval[5];
cz eval[3],eval[4];
u3(pi/4,-pi/2,pi/2) eval[4];
cz eval[3],eval[4];
u3(pi/4,pi/2,-pi/2) eval[4];
u3(pi/8,pi/2,-pi/2) eval[5];
u3(pi/16,pi/2,-pi/2) eval[6];
u3(pi/32,pi/2,-pi/2) eval[7];
u3(pi/64,pi/2,-pi/2) eval[8];
cz eval[2],eval[8];
u3(pi/128,-pi/2,pi/2) eval[8];
cz eval[2],eval[8];
cz eval[2],eval[7];
u3(pi/64,-pi/2,pi/2) eval[7];
cz eval[2],eval[7];
cz eval[2],eval[6];
u3(pi/32,-pi/2,pi/2) eval[6];
cz eval[2],eval[6];
cz eval[2],eval[5];
u3(pi/16,-pi/2,pi/2) eval[5];
cz eval[2],eval[5];
cz eval[2],eval[4];
u3(pi/8,-pi/2,pi/2) eval[4];
cz eval[2],eval[4];
cz eval[2],eval[3];
u3(pi/4,-pi/2,pi/2) eval[3];
cz eval[2],eval[3];
u3(pi/4,pi/2,-pi/2) eval[3];
u3(pi/8,pi/2,-pi/2) eval[4];
u3(pi/16,pi/2,-pi/2) eval[5];
u3(pi/32,pi/2,-pi/2) eval[6];
u3(pi/64,pi/2,-pi/2) eval[7];
u3(pi/128,pi/2,-pi/2) eval[8];
cz eval[1],eval[8];
u3(pi/256,-pi/2,pi/2) eval[8];
cz eval[1],eval[8];
cz eval[1],eval[7];
u3(pi/128,-pi/2,pi/2) eval[7];
cz eval[1],eval[7];
cz eval[1],eval[6];
u3(pi/64,-pi/2,pi/2) eval[6];
cz eval[1],eval[6];
cz eval[1],eval[5];
u3(pi/32,-pi/2,pi/2) eval[5];
cz eval[1],eval[5];
cz eval[1],eval[4];
u3(pi/16,-pi/2,pi/2) eval[4];
cz eval[1],eval[4];
cz eval[1],eval[3];
u3(pi/8,-pi/2,pi/2) eval[3];
cz eval[1],eval[3];
cz eval[1],eval[2];
u3(pi/4,-pi/2,pi/2) eval[2];
cz eval[1],eval[2];
u3(pi/4,pi/2,-pi/2) eval[2];
u3(pi/8,pi/2,-pi/2) eval[3];
u3(pi/16,pi/2,-pi/2) eval[4];
u3(pi/32,pi/2,-pi/2) eval[5];
u3(pi/64,pi/2,-pi/2) eval[6];
u3(pi/128,pi/2,-pi/2) eval[7];
u3(pi/256,pi/2,-pi/2) eval[8];
cz eval[0],eval[8];
u3(pi/512,-pi/2,pi/2) eval[8];
cz eval[0],eval[8];
cz eval[0],eval[7];
u3(pi/256,-pi/2,pi/2) eval[7];
cz eval[0],eval[7];
cz eval[0],eval[6];
u3(pi/128,-pi/2,pi/2) eval[6];
cz eval[0],eval[6];
cz eval[0],eval[5];
u3(pi/64,-pi/2,pi/2) eval[5];
cz eval[0],eval[5];
cz eval[0],eval[4];
u3(pi/32,-pi/2,pi/2) eval[4];
cz eval[0],eval[4];
cz eval[0],eval[3];
u3(pi/16,-pi/2,pi/2) eval[3];
cz eval[0],eval[3];
cz eval[0],eval[2];
u3(pi/8,-pi/2,pi/2) eval[2];
cz eval[0],eval[2];
cz eval[0],eval[1];
u3(pi/4,-pi/2,pi/2) eval[1];
cz eval[0],eval[1];
u2(0,pi) eval[0];
u2(-pi/4,-pi) eval[1];
u2(-pi/8,-pi) eval[2];
u2(-pi/16,-pi) eval[3];
u2(-pi/32,-pi) eval[4];
u2(-pi/64,-pi) eval[5];
u2(-pi/128,-pi) eval[6];
u2(-pi/256,-pi) eval[7];
u2(-pi/512,-pi) eval[8];
barrier eval[0],eval[1],eval[2],eval[3],eval[4],eval[5],eval[6],eval[7],eval[8],q[0];
measure eval[0] -> meas[0];
measure eval[1] -> meas[1];
measure eval[2] -> meas[2];
measure eval[3] -> meas[3];
measure eval[4] -> meas[4];
measure eval[5] -> meas[5];
measure eval[6] -> meas[6];
measure eval[7] -> meas[7];
measure eval[8] -> meas[8];
measure q[0] -> meas[9];
