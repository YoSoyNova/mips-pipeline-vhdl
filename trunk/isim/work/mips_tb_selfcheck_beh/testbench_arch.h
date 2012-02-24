////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_mips_tb_selfcheck_beh_testbench_arch_H
#define H_Work_mips_tb_selfcheck_beh_testbench_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_mips_tb_selfcheck_beh_testbench_arch: public HSim__s6 {
public:


HSim__s4 V1s;
HSimAccessVar V1v;
HSim__s4 C1z;
HSim__s4 C1D;
HSim__s4 C1G;
    HSim__s1 SA[7];
    Work_mips_tb_selfcheck_beh_testbench_arch(const char * name);
    ~Work_mips_tb_selfcheck_beh_testbench_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_mips_tb_selfcheck_beh_testbench_arch(const char *name);

#endif