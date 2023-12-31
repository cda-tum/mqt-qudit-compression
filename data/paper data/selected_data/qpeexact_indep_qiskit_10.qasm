OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
qreg psi[1];
creg c[9];
u2(-2.3836741,-pi) q[6];
u3(pi,-1.3499031,-pi) psi[0];
cz psi[0],q[0];
u3(1.3499031,-pi/2,pi/2) q[0];
cz psi[0],q[0];
u1(1.1290099) psi[0];
cz psi[0],q[1];
u2(-1.3499031,-pi) q[0];
cz q[0],q[8];
u2(0,pi) q[0];
u3(0.44178647,pi/2,-pi/2) q[1];
cz psi[0],q[1];
cz psi[0],q[2];
u2(0.44178646,-pi) q[1];
cz q[1],q[7];
u2(0,pi) q[1];
u3(0.88357293,pi/2,-pi/2) q[2];
cz psi[0],q[2];
cz psi[0],q[3];
u2(0.88357293,-pi) q[2];
u3(7*pi/16,-pi/2,pi/2) q[3];
cz psi[0],q[3];
cz psi[0],q[4];
u2(-7*pi/16,-pi) q[3];
u3(pi/8,pi/2,-pi/2) q[4];
cz psi[0],q[4];
cz psi[0],q[5];
u2(0.29452431,-pi) q[4];
u3(pi/4,pi/2,-pi/2) q[5];
cz psi[0],q[5];
u3(pi/4,-pi/2,pi/2) q[5];
cz q[3],q[5];
u2(0,pi) q[3];
u2(0,pi) q[5];
cz q[5],q[3];
u2(0,pi) q[3];
u2(0,pi) q[5];
cz q[3],q[5];
u1(-7*pi/16) q[3];
u2(-pi/64,-pi) q[5];
cz q[6],psi[0];
u2(0,-0.75791853) q[6];
cz q[2],q[6];
u2(0,pi) q[2];
u2(0,pi) q[6];
cz q[6],q[2];
u2(0,pi) q[2];
u2(0,pi) q[6];
cz q[2],q[6];
u1(-3*pi/8) q[2];
u2(-pi/128,-pi) q[6];
u2(0,pi) q[7];
cz q[7],q[1];
u2(0,pi) q[1];
u2(0,pi) q[7];
cz q[1],q[7];
u1(-pi/4) q[1];
u2(-pi/256,-pi) q[7];
u2(0,pi) q[8];
cz q[8],q[0];
u2(0,pi) q[0];
u2(0,pi) q[8];
cz q[0],q[8];
cz q[1],q[0];
u3(pi/4,-pi/2,pi/2) q[0];
cz q[1],q[0];
u3(pi/4,pi/2,-pi/2) q[0];
cz q[2],q[0];
u3(pi/8,-pi/2,pi/2) q[0];
cz q[2],q[0];
u3(pi/8,pi/2,-pi/2) q[0];
cz q[2],q[1];
u3(pi/4,-pi/2,pi/2) q[1];
cz q[2],q[1];
u3(pi/4,pi/2,-pi/2) q[1];
cz q[3],q[0];
u3(pi/16,-pi/2,pi/2) q[0];
cz q[3],q[0];
u3(pi/16,pi/2,-pi/2) q[0];
cz q[3],q[1];
u3(pi/8,-pi/2,pi/2) q[1];
cz q[3],q[1];
u3(pi/8,pi/2,-pi/2) q[1];
cz q[3],q[2];
u3(pi/4,-pi/2,pi/2) q[2];
cz q[3],q[2];
u3(pi/4,pi/2,-pi/2) q[2];
cz q[4],q[0];
u3(pi/32,-pi/2,pi/2) q[0];
cz q[4],q[0];
u3(pi/32,pi/2,-pi/2) q[0];
u1(-7*pi/16) q[4];
cz q[4],q[1];
u3(pi/16,-pi/2,pi/2) q[1];
cz q[4],q[1];
u3(pi/16,pi/2,-pi/2) q[1];
cz q[4],q[2];
u3(pi/8,-pi/2,pi/2) q[2];
cz q[4],q[2];
u3(pi/8,pi/2,-pi/2) q[2];
cz q[4],q[3];
u3(pi/4,-pi/2,pi/2) q[3];
cz q[4],q[3];
u3(pi/4,pi/2,-pi/2) q[3];
cz q[5],q[0];
u3(pi/64,-pi/2,pi/2) q[0];
cz q[5],q[0];
u3(pi/64,pi/2,-pi/2) q[0];
u1(-1.4726216) q[5];
cz q[5],q[1];
u3(pi/32,-pi/2,pi/2) q[1];
cz q[5],q[1];
u3(pi/32,pi/2,-pi/2) q[1];
cz q[5],q[2];
u3(pi/16,-pi/2,pi/2) q[2];
cz q[5],q[2];
u3(pi/16,pi/2,-pi/2) q[2];
cz q[5],q[3];
u3(pi/8,-pi/2,pi/2) q[3];
cz q[5],q[3];
u3(pi/8,pi/2,-pi/2) q[3];
cz q[5],q[4];
u3(pi/4,-pi/2,pi/2) q[4];
cz q[5],q[4];
u3(pi/4,pi/2,-pi/2) q[4];
cz q[6],q[0];
u3(pi/128,-pi/2,pi/2) q[0];
cz q[6],q[0];
u3(pi/128,pi/2,-pi/2) q[0];
u1(-1.5217089) q[6];
cz q[6],q[1];
u3(pi/64,-pi/2,pi/2) q[1];
cz q[6],q[1];
u3(pi/64,pi/2,-pi/2) q[1];
cz q[6],q[2];
u3(pi/32,-pi/2,pi/2) q[2];
cz q[6],q[2];
u3(pi/32,pi/2,-pi/2) q[2];
cz q[6],q[3];
u3(pi/16,-pi/2,pi/2) q[3];
cz q[6],q[3];
u3(pi/16,pi/2,-pi/2) q[3];
cz q[6],q[4];
u3(pi/8,-pi/2,pi/2) q[4];
cz q[6],q[4];
u3(pi/8,pi/2,-pi/2) q[4];
cz q[6],q[5];
u3(pi/4,-pi/2,pi/2) q[5];
cz q[6],q[5];
u3(pi/4,pi/2,-pi/2) q[5];
cz q[7],q[0];
u3(pi/256,-pi/2,pi/2) q[0];
cz q[7],q[0];
u3(pi/256,pi/2,-pi/2) q[0];
u1(-1.5462526) q[7];
cz q[7],q[1];
u3(pi/128,-pi/2,pi/2) q[1];
cz q[7],q[1];
u3(pi/128,pi/2,-pi/2) q[1];
cz q[7],q[2];
u3(pi/64,-pi/2,pi/2) q[2];
cz q[7],q[2];
u3(pi/64,pi/2,-pi/2) q[2];
cz q[7],q[3];
u3(pi/32,-pi/2,pi/2) q[3];
cz q[7],q[3];
u3(pi/32,pi/2,-pi/2) q[3];
cz q[7],q[4];
u3(pi/16,-pi/2,pi/2) q[4];
cz q[7],q[4];
u3(pi/16,pi/2,-pi/2) q[4];
cz q[7],q[5];
u3(pi/8,-pi/2,pi/2) q[5];
cz q[7],q[5];
u3(pi/8,pi/2,-pi/2) q[5];
cz q[7],q[6];
u3(pi/4,-pi/2,pi/2) q[6];
cz q[7],q[6];
u3(pi/4,pi/2,-pi/2) q[6];
u2(-pi/512,-pi) q[8];
cz q[8],q[0];
u3(pi/512,-pi/2,pi/2) q[0];
cz q[8],q[0];
u2(-pi/512,-pi) q[0];
u1(-1.5585245) q[8];
cz q[8],q[1];
u3(pi/256,-pi/2,pi/2) q[1];
cz q[8],q[1];
u2(-pi/256,-pi) q[1];
cz q[8],q[2];
u3(pi/128,-pi/2,pi/2) q[2];
cz q[8],q[2];
u2(-pi/128,-pi) q[2];
cz q[8],q[3];
u3(pi/64,-pi/2,pi/2) q[3];
cz q[8],q[3];
u2(-pi/64,-pi) q[3];
cz q[8],q[4];
u3(pi/32,-pi/2,pi/2) q[4];
cz q[8],q[4];
u2(-pi/32,-pi) q[4];
cz q[8],q[5];
u3(pi/16,-pi/2,pi/2) q[5];
cz q[8],q[5];
u2(-pi/16,-pi) q[5];
cz q[8],q[6];
u3(pi/8,-pi/2,pi/2) q[6];
cz q[8],q[6];
u2(-pi/8,-pi) q[6];
cz q[8],q[7];
u3(pi/4,-pi/2,pi/2) q[7];
cz q[8],q[7];
u2(-pi/4,-pi) q[7];
u2(0,pi) q[8];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],psi[0];
measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
measure q[4] -> c[4];
measure q[5] -> c[5];
measure q[6] -> c[6];
measure q[7] -> c[7];
measure q[8] -> c[8];
