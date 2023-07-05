OPENQASM 2.0;
include "qelib1.inc";
qreg q[31];
creg meas[31];
u2(0,pi) q[0];
u2(0,pi) q[1];
cz q[0],q[1];
u2(0,pi) q[2];
u2(0,pi) q[3];
cz q[2],q[3];
u2(0,pi) q[4];
cz q[1],q[4];
u2(0,pi) q[5];
cz q[4],q[5];
u2(0,pi) q[6];
cz q[3],q[6];
u2(0,pi) q[7];
u2(0,pi) q[8];
cz q[7],q[8];
u2(0,pi) q[9];
cz q[8],q[9];
u2(0,pi) q[10];
cz q[7],q[10];
u2(0,pi) q[11];
cz q[10],q[11];
u2(0,pi) q[12];
u2(0,pi) q[13];
cz q[12],q[13];
u2(0,pi) q[14];
u2(0,pi) q[15];
cz q[14],q[15];
u2(0,pi) q[16];
u2(0,pi) q[17];
cz q[16],q[17];
u2(0,pi) q[18];
cz q[6],q[18];
cz q[9],q[18];
u2(0,pi) q[19];
cz q[2],q[19];
u2(0,pi) q[20];
cz q[19],q[20];
u2(0,pi) q[21];
cz q[11],q[21];
cz q[14],q[21];
u2(0,pi) q[22];
cz q[5],q[22];
cz q[15],q[22];
u2(0,pi) q[23];
cz q[13],q[23];
u2(0,pi) q[24];
u2(0,pi) q[25];
cz q[16],q[25];
cz q[24],q[25];
u2(0,pi) q[26];
cz q[20],q[26];
cz q[23],q[26];
u2(0,pi) q[27];
cz q[0],q[27];
u2(0,pi) q[28];
cz q[12],q[28];
cz q[17],q[28];
u2(0,pi) q[29];
cz q[27],q[29];
u2(0,pi) q[30];
cz q[24],q[30];
cz q[29],q[30];
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[16],q[17],q[18],q[19],q[20],q[21],q[22],q[23],q[24],q[25],q[26],q[27],q[28],q[29],q[30];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];
measure q[16] -> meas[16];
measure q[17] -> meas[17];
measure q[18] -> meas[18];
measure q[19] -> meas[19];
measure q[20] -> meas[20];
measure q[21] -> meas[21];
measure q[22] -> meas[22];
measure q[23] -> meas[23];
measure q[24] -> meas[24];
measure q[25] -> meas[25];
measure q[26] -> meas[26];
measure q[27] -> meas[27];
measure q[28] -> meas[28];
measure q[29] -> meas[29];
measure q[30] -> meas[30];
