--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : t_memacces.vhw
-- /___/   /\     Timestamp : Fri Dec 16 15:26:21 2011
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: t_memacces
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY t_memacces IS
END t_memacces;

ARCHITECTURE testbench_arch OF t_memacces IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT memory_acc
        PORT (
            rst : In std_logic;
            clk : In std_logic;
            M : In std_logic_vector (2 DownTo 0);
            WB : In std_logic_vector (1 DownTo 0);
            AluResult : In std_logic_vector (31 DownTo 0);
            AluSalto : In std_logic_vector (31 DownTo 0);
            dato2 : In std_logic_vector (31 DownTo 0);
            cero : In std_logic;
            EscrDato : In std_logic_vector (4 DownTo 0);
            Dato_leido : Out std_logic_vector (31 DownTo 0);
            AluResult_out : Out std_logic_vector (31 DownTo 0);
            alusalto_out : Out std_logic_vector (31 DownTo 0);
            EscrDato_out : Out std_logic_vector (4 DownTo 0);
            WB_out : Out std_logic_vector (1 DownTo 0);
            FuentePc : Out std_logic
        );
    END COMPONENT;

    SIGNAL rst : std_logic := '0';
    SIGNAL clk : std_logic := '0';
    SIGNAL M : std_logic_vector (2 DownTo 0) := "000";
    SIGNAL WB : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL AluResult : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL AluSalto : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL dato2 : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL cero : std_logic := '0';
    SIGNAL EscrDato : std_logic_vector (4 DownTo 0) := "00000";
    SIGNAL Dato_leido : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL AluResult_out : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL alusalto_out : std_logic_vector (31 DownTo 0) := "00000000000000000000000000000000";
    SIGNAL EscrDato_out : std_logic_vector (4 DownTo 0) := "00000";
    SIGNAL WB_out : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL FuentePc : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : memory_acc
        PORT MAP (
            rst => rst,
            clk => clk,
            M => M,
            WB => WB,
            AluResult => AluResult,
            AluSalto => AluSalto,
            dato2 => dato2,
            cero => cero,
            EscrDato => EscrDato,
            Dato_leido => Dato_leido,
            AluResult_out => AluResult_out,
            alusalto_out => alusalto_out,
            EscrDato_out => EscrDato_out,
            WB_out => WB_out,
            FuentePc => FuentePc
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                rst <= '1';
                EscrDato <= "00101";
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 85 ns;
                rst <= '0';
                -- -------------------------------------
                WAIT FOR 3015 ns;

            END PROCESS;

    END testbench_arch;

