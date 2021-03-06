/* Generated by Yosys 0.9 (git sha1 1979e0b) */

(* top =  1  *)
(* src = "Demux_8x32_Estruc.v:1" *)
module Demux_8x32_Estruc(data_out_8x32_Estruc, valid_out_Estruc, clk_4f, data_in_8x32, valid_in_8x32, reset_L);
  (* src = "Demux_8x32_Estruc.v:17" *)
  wire [31:0] _000_;
  (* src = "Demux_8x32_Estruc.v:17" *)
  wire [1:0] _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  (* src = "Demux_8x32_Estruc.v:4" *)
  input clk_4f;
  (* src = "Demux_8x32_Estruc.v:5" *)
  input [7:0] data_in_8x32;
  (* src = "Demux_8x32_Estruc.v:2" *)
  output [31:0] data_out_8x32_Estruc;
  (* src = "Demux_8x32_Estruc.v:7" *)
  input reset_L;
  (* src = "Demux_8x32_Estruc.v:9" *)
  wire [1:0] selector_clk_4f;
  (* src = "Demux_8x32_Estruc.v:6" *)
  input valid_in_8x32;
  (* src = "Demux_8x32_Estruc.v:3" *)
  output valid_out_Estruc;
  NOT _136_ (
    .A(selector_clk_4f[0]),
    .Y(_115_)
  );
  NOT _137_ (
    .A(selector_clk_4f[1]),
    .Y(_116_)
  );
  NOT _138_ (
    .A(data_in_8x32[0]),
    .Y(_117_)
  );
  NOT _139_ (
    .A(data_in_8x32[1]),
    .Y(_118_)
  );
  NOT _140_ (
    .A(data_in_8x32[2]),
    .Y(_119_)
  );
  NOT _141_ (
    .A(data_in_8x32[3]),
    .Y(_120_)
  );
  NOT _142_ (
    .A(data_in_8x32[4]),
    .Y(_121_)
  );
  NOT _143_ (
    .A(data_in_8x32[5]),
    .Y(_122_)
  );
  NOT _144_ (
    .A(data_in_8x32[6]),
    .Y(_123_)
  );
  NOT _145_ (
    .A(data_in_8x32[7]),
    .Y(_124_)
  );
  NOT _146_ (
    .A(reset_L),
    .Y(_125_)
  );
  NOT _147_ (
    .A(valid_in_8x32),
    .Y(_126_)
  );
  NOR _148_ (
    .A(selector_clk_4f[0]),
    .B(_126_),
    .Y(_127_)
  );
  NAND _149_ (
    .A(_115_),
    .B(valid_in_8x32),
    .Y(_128_)
  );
  NAND _150_ (
    .A(selector_clk_4f[1]),
    .B(reset_L),
    .Y(_129_)
  );
  NOT _151_ (
    .A(_129_),
    .Y(_130_)
  );
  NOR _152_ (
    .A(_128_),
    .B(_129_),
    .Y(_131_)
  );
  NAND _153_ (
    .A(_127_),
    .B(_130_),
    .Y(_132_)
  );
  NOR _154_ (
    .A(data_in_8x32[0]),
    .B(_132_),
    .Y(_133_)
  );
  NAND _155_ (
    .A(data_out_8x32_Estruc[8]),
    .B(reset_L),
    .Y(_134_)
  );
  NOT _156_ (
    .A(_134_),
    .Y(_135_)
  );
  NOR _157_ (
    .A(_131_),
    .B(_135_),
    .Y(_002_)
  );
  NOR _158_ (
    .A(_133_),
    .B(_002_),
    .Y(_000_[8])
  );
  NOR _159_ (
    .A(data_in_8x32[1]),
    .B(_132_),
    .Y(_003_)
  );
  NAND _160_ (
    .A(data_out_8x32_Estruc[9]),
    .B(reset_L),
    .Y(_004_)
  );
  NOT _161_ (
    .A(_004_),
    .Y(_005_)
  );
  NOR _162_ (
    .A(_131_),
    .B(_005_),
    .Y(_006_)
  );
  NOR _163_ (
    .A(_003_),
    .B(_006_),
    .Y(_000_[9])
  );
  NOR _164_ (
    .A(data_in_8x32[2]),
    .B(_132_),
    .Y(_007_)
  );
  NAND _165_ (
    .A(data_out_8x32_Estruc[10]),
    .B(reset_L),
    .Y(_008_)
  );
  NOT _166_ (
    .A(_008_),
    .Y(_009_)
  );
  NOR _167_ (
    .A(_131_),
    .B(_009_),
    .Y(_010_)
  );
  NOR _168_ (
    .A(_007_),
    .B(_010_),
    .Y(_000_[10])
  );
  NOR _169_ (
    .A(data_in_8x32[3]),
    .B(_132_),
    .Y(_011_)
  );
  NAND _170_ (
    .A(data_out_8x32_Estruc[11]),
    .B(reset_L),
    .Y(_012_)
  );
  NOT _171_ (
    .A(_012_),
    .Y(_013_)
  );
  NOR _172_ (
    .A(_131_),
    .B(_013_),
    .Y(_014_)
  );
  NOR _173_ (
    .A(_011_),
    .B(_014_),
    .Y(_000_[11])
  );
  NOR _174_ (
    .A(data_in_8x32[4]),
    .B(_132_),
    .Y(_015_)
  );
  NAND _175_ (
    .A(data_out_8x32_Estruc[12]),
    .B(reset_L),
    .Y(_016_)
  );
  NOT _176_ (
    .A(_016_),
    .Y(_017_)
  );
  NOR _177_ (
    .A(_131_),
    .B(_017_),
    .Y(_018_)
  );
  NOR _178_ (
    .A(_015_),
    .B(_018_),
    .Y(_000_[12])
  );
  NOR _179_ (
    .A(data_in_8x32[5]),
    .B(_132_),
    .Y(_019_)
  );
  NAND _180_ (
    .A(data_out_8x32_Estruc[13]),
    .B(reset_L),
    .Y(_020_)
  );
  NOT _181_ (
    .A(_020_),
    .Y(_021_)
  );
  NOR _182_ (
    .A(_131_),
    .B(_021_),
    .Y(_022_)
  );
  NOR _183_ (
    .A(_019_),
    .B(_022_),
    .Y(_000_[13])
  );
  NOR _184_ (
    .A(data_in_8x32[6]),
    .B(_132_),
    .Y(_023_)
  );
  NAND _185_ (
    .A(data_out_8x32_Estruc[14]),
    .B(reset_L),
    .Y(_024_)
  );
  NOT _186_ (
    .A(_024_),
    .Y(_025_)
  );
  NOR _187_ (
    .A(_131_),
    .B(_025_),
    .Y(_026_)
  );
  NOR _188_ (
    .A(_023_),
    .B(_026_),
    .Y(_000_[14])
  );
  NOR _189_ (
    .A(data_in_8x32[7]),
    .B(_132_),
    .Y(_027_)
  );
  NAND _190_ (
    .A(data_out_8x32_Estruc[15]),
    .B(reset_L),
    .Y(_028_)
  );
  NOT _191_ (
    .A(_028_),
    .Y(_029_)
  );
  NOR _192_ (
    .A(_131_),
    .B(_029_),
    .Y(_030_)
  );
  NOR _193_ (
    .A(_027_),
    .B(_030_),
    .Y(_000_[15])
  );
  NAND _194_ (
    .A(selector_clk_4f[0]),
    .B(valid_in_8x32),
    .Y(_031_)
  );
  NOR _195_ (
    .A(_129_),
    .B(_031_),
    .Y(_032_)
  );
  NAND _196_ (
    .A(_117_),
    .B(_032_),
    .Y(_033_)
  );
  NOR _197_ (
    .A(data_out_8x32_Estruc[0]),
    .B(_032_),
    .Y(_034_)
  );
  NAND _198_ (
    .A(reset_L),
    .B(_033_),
    .Y(_035_)
  );
  NOR _199_ (
    .A(_034_),
    .B(_035_),
    .Y(_000_[0])
  );
  NAND _200_ (
    .A(_118_),
    .B(_032_),
    .Y(_036_)
  );
  NOR _201_ (
    .A(data_out_8x32_Estruc[1]),
    .B(_032_),
    .Y(_037_)
  );
  NAND _202_ (
    .A(reset_L),
    .B(_036_),
    .Y(_038_)
  );
  NOR _203_ (
    .A(_037_),
    .B(_038_),
    .Y(_000_[1])
  );
  NAND _204_ (
    .A(_119_),
    .B(_032_),
    .Y(_039_)
  );
  NOR _205_ (
    .A(data_out_8x32_Estruc[2]),
    .B(_032_),
    .Y(_040_)
  );
  NAND _206_ (
    .A(reset_L),
    .B(_039_),
    .Y(_041_)
  );
  NOR _207_ (
    .A(_040_),
    .B(_041_),
    .Y(_000_[2])
  );
  NAND _208_ (
    .A(_120_),
    .B(_032_),
    .Y(_042_)
  );
  NOR _209_ (
    .A(data_out_8x32_Estruc[3]),
    .B(_032_),
    .Y(_043_)
  );
  NAND _210_ (
    .A(reset_L),
    .B(_042_),
    .Y(_044_)
  );
  NOR _211_ (
    .A(_043_),
    .B(_044_),
    .Y(_000_[3])
  );
  NAND _212_ (
    .A(_121_),
    .B(_032_),
    .Y(_045_)
  );
  NOR _213_ (
    .A(data_out_8x32_Estruc[4]),
    .B(_032_),
    .Y(_046_)
  );
  NAND _214_ (
    .A(reset_L),
    .B(_045_),
    .Y(_047_)
  );
  NOR _215_ (
    .A(_046_),
    .B(_047_),
    .Y(_000_[4])
  );
  NAND _216_ (
    .A(_122_),
    .B(_032_),
    .Y(_048_)
  );
  NOR _217_ (
    .A(data_out_8x32_Estruc[5]),
    .B(_032_),
    .Y(_049_)
  );
  NAND _218_ (
    .A(reset_L),
    .B(_048_),
    .Y(_050_)
  );
  NOR _219_ (
    .A(_049_),
    .B(_050_),
    .Y(_000_[5])
  );
  NAND _220_ (
    .A(_123_),
    .B(_032_),
    .Y(_051_)
  );
  NOR _221_ (
    .A(data_out_8x32_Estruc[6]),
    .B(_032_),
    .Y(_052_)
  );
  NAND _222_ (
    .A(reset_L),
    .B(_051_),
    .Y(_053_)
  );
  NOR _223_ (
    .A(_052_),
    .B(_053_),
    .Y(_000_[6])
  );
  NAND _224_ (
    .A(_124_),
    .B(_032_),
    .Y(_054_)
  );
  NOR _225_ (
    .A(data_out_8x32_Estruc[7]),
    .B(_032_),
    .Y(_055_)
  );
  NAND _226_ (
    .A(reset_L),
    .B(_054_),
    .Y(_056_)
  );
  NOR _227_ (
    .A(_055_),
    .B(_056_),
    .Y(_000_[7])
  );
  NOR _228_ (
    .A(selector_clk_4f[1]),
    .B(_031_),
    .Y(_057_)
  );
  NOR _229_ (
    .A(_125_),
    .B(_057_),
    .Y(_058_)
  );
  NAND _230_ (
    .A(data_out_8x32_Estruc[16]),
    .B(_058_),
    .Y(_059_)
  );
  NOR _231_ (
    .A(selector_clk_4f[1]),
    .B(_125_),
    .Y(_060_)
  );
  NAND _232_ (
    .A(_116_),
    .B(reset_L),
    .Y(_061_)
  );
  NOR _233_ (
    .A(_031_),
    .B(_061_),
    .Y(_062_)
  );
  NAND _234_ (
    .A(data_in_8x32[0]),
    .B(_062_),
    .Y(_063_)
  );
  NAND _235_ (
    .A(_059_),
    .B(_063_),
    .Y(_000_[16])
  );
  NAND _236_ (
    .A(data_out_8x32_Estruc[17]),
    .B(_058_),
    .Y(_064_)
  );
  NAND _237_ (
    .A(data_in_8x32[1]),
    .B(_062_),
    .Y(_065_)
  );
  NAND _238_ (
    .A(_064_),
    .B(_065_),
    .Y(_000_[17])
  );
  NAND _239_ (
    .A(data_out_8x32_Estruc[18]),
    .B(_058_),
    .Y(_066_)
  );
  NAND _240_ (
    .A(data_in_8x32[2]),
    .B(_062_),
    .Y(_067_)
  );
  NAND _241_ (
    .A(_066_),
    .B(_067_),
    .Y(_000_[18])
  );
  NAND _242_ (
    .A(data_out_8x32_Estruc[19]),
    .B(_058_),
    .Y(_068_)
  );
  NAND _243_ (
    .A(data_in_8x32[3]),
    .B(_062_),
    .Y(_069_)
  );
  NAND _244_ (
    .A(_068_),
    .B(_069_),
    .Y(_000_[19])
  );
  NAND _245_ (
    .A(data_out_8x32_Estruc[20]),
    .B(_058_),
    .Y(_070_)
  );
  NAND _246_ (
    .A(data_in_8x32[4]),
    .B(_062_),
    .Y(_071_)
  );
  NAND _247_ (
    .A(_070_),
    .B(_071_),
    .Y(_000_[20])
  );
  NAND _248_ (
    .A(data_out_8x32_Estruc[21]),
    .B(_058_),
    .Y(_072_)
  );
  NAND _249_ (
    .A(data_in_8x32[5]),
    .B(_062_),
    .Y(_073_)
  );
  NAND _250_ (
    .A(_072_),
    .B(_073_),
    .Y(_000_[21])
  );
  NAND _251_ (
    .A(data_out_8x32_Estruc[22]),
    .B(_058_),
    .Y(_074_)
  );
  NAND _252_ (
    .A(data_in_8x32[6]),
    .B(_062_),
    .Y(_075_)
  );
  NAND _253_ (
    .A(_074_),
    .B(_075_),
    .Y(_000_[22])
  );
  NAND _254_ (
    .A(data_out_8x32_Estruc[23]),
    .B(_058_),
    .Y(_076_)
  );
  NAND _255_ (
    .A(data_in_8x32[7]),
    .B(_062_),
    .Y(_077_)
  );
  NAND _256_ (
    .A(_076_),
    .B(_077_),
    .Y(_000_[23])
  );
  NOR _257_ (
    .A(_128_),
    .B(_061_),
    .Y(_078_)
  );
  NAND _258_ (
    .A(_127_),
    .B(_060_),
    .Y(_079_)
  );
  NOR _259_ (
    .A(data_in_8x32[0]),
    .B(_079_),
    .Y(_080_)
  );
  NAND _260_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[24]),
    .Y(_081_)
  );
  NOT _261_ (
    .A(_081_),
    .Y(_082_)
  );
  NOR _262_ (
    .A(_078_),
    .B(_082_),
    .Y(_083_)
  );
  NOR _263_ (
    .A(_080_),
    .B(_083_),
    .Y(_000_[24])
  );
  NOR _264_ (
    .A(data_in_8x32[1]),
    .B(_079_),
    .Y(_084_)
  );
  NAND _265_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[25]),
    .Y(_085_)
  );
  NOT _266_ (
    .A(_085_),
    .Y(_086_)
  );
  NOR _267_ (
    .A(_078_),
    .B(_086_),
    .Y(_087_)
  );
  NOR _268_ (
    .A(_084_),
    .B(_087_),
    .Y(_000_[25])
  );
  NOR _269_ (
    .A(data_in_8x32[2]),
    .B(_079_),
    .Y(_088_)
  );
  NAND _270_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[26]),
    .Y(_089_)
  );
  NOT _271_ (
    .A(_089_),
    .Y(_090_)
  );
  NOR _272_ (
    .A(_078_),
    .B(_090_),
    .Y(_091_)
  );
  NOR _273_ (
    .A(_088_),
    .B(_091_),
    .Y(_000_[26])
  );
  NOR _274_ (
    .A(data_in_8x32[3]),
    .B(_079_),
    .Y(_092_)
  );
  NAND _275_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[27]),
    .Y(_093_)
  );
  NOT _276_ (
    .A(_093_),
    .Y(_094_)
  );
  NOR _277_ (
    .A(_078_),
    .B(_094_),
    .Y(_095_)
  );
  NOR _278_ (
    .A(_092_),
    .B(_095_),
    .Y(_000_[27])
  );
  NOR _279_ (
    .A(data_in_8x32[4]),
    .B(_079_),
    .Y(_096_)
  );
  NAND _280_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[28]),
    .Y(_097_)
  );
  NOT _281_ (
    .A(_097_),
    .Y(_098_)
  );
  NOR _282_ (
    .A(_078_),
    .B(_098_),
    .Y(_099_)
  );
  NOR _283_ (
    .A(_096_),
    .B(_099_),
    .Y(_000_[28])
  );
  NOR _284_ (
    .A(data_in_8x32[5]),
    .B(_079_),
    .Y(_100_)
  );
  NAND _285_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[29]),
    .Y(_101_)
  );
  NOT _286_ (
    .A(_101_),
    .Y(_102_)
  );
  NOR _287_ (
    .A(_078_),
    .B(_102_),
    .Y(_103_)
  );
  NOR _288_ (
    .A(_100_),
    .B(_103_),
    .Y(_000_[29])
  );
  NOR _289_ (
    .A(data_in_8x32[6]),
    .B(_079_),
    .Y(_104_)
  );
  NAND _290_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[30]),
    .Y(_105_)
  );
  NOT _291_ (
    .A(_105_),
    .Y(_106_)
  );
  NOR _292_ (
    .A(_078_),
    .B(_106_),
    .Y(_107_)
  );
  NOR _293_ (
    .A(_104_),
    .B(_107_),
    .Y(_000_[30])
  );
  NOR _294_ (
    .A(data_in_8x32[7]),
    .B(_079_),
    .Y(_108_)
  );
  NAND _295_ (
    .A(reset_L),
    .B(data_out_8x32_Estruc[31]),
    .Y(_109_)
  );
  NOT _296_ (
    .A(_109_),
    .Y(_110_)
  );
  NOR _297_ (
    .A(_078_),
    .B(_110_),
    .Y(_111_)
  );
  NOR _298_ (
    .A(_108_),
    .B(_111_),
    .Y(_000_[31])
  );
  NOR _299_ (
    .A(_115_),
    .B(valid_in_8x32),
    .Y(_112_)
  );
  NOR _300_ (
    .A(_125_),
    .B(_112_),
    .Y(_113_)
  );
  NAND _301_ (
    .A(_128_),
    .B(_113_),
    .Y(_001_[0])
  );
  NAND _302_ (
    .A(selector_clk_4f[1]),
    .B(_031_),
    .Y(_114_)
  );
  NAND _303_ (
    .A(_058_),
    .B(_114_),
    .Y(_001_[1])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _304_ (
    .C(clk_4f),
    .D(_001_[0]),
    .Q(selector_clk_4f[0])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _305_ (
    .C(clk_4f),
    .D(_001_[1]),
    .Q(selector_clk_4f[1])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _306_ (
    .C(clk_4f),
    .D(_000_[0]),
    .Q(data_out_8x32_Estruc[0])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _307_ (
    .C(clk_4f),
    .D(_000_[1]),
    .Q(data_out_8x32_Estruc[1])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _308_ (
    .C(clk_4f),
    .D(_000_[2]),
    .Q(data_out_8x32_Estruc[2])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _309_ (
    .C(clk_4f),
    .D(_000_[3]),
    .Q(data_out_8x32_Estruc[3])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _310_ (
    .C(clk_4f),
    .D(_000_[4]),
    .Q(data_out_8x32_Estruc[4])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _311_ (
    .C(clk_4f),
    .D(_000_[5]),
    .Q(data_out_8x32_Estruc[5])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _312_ (
    .C(clk_4f),
    .D(_000_[6]),
    .Q(data_out_8x32_Estruc[6])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _313_ (
    .C(clk_4f),
    .D(_000_[7]),
    .Q(data_out_8x32_Estruc[7])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _314_ (
    .C(clk_4f),
    .D(_000_[8]),
    .Q(data_out_8x32_Estruc[8])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _315_ (
    .C(clk_4f),
    .D(_000_[9]),
    .Q(data_out_8x32_Estruc[9])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _316_ (
    .C(clk_4f),
    .D(_000_[10]),
    .Q(data_out_8x32_Estruc[10])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _317_ (
    .C(clk_4f),
    .D(_000_[11]),
    .Q(data_out_8x32_Estruc[11])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _318_ (
    .C(clk_4f),
    .D(_000_[12]),
    .Q(data_out_8x32_Estruc[12])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _319_ (
    .C(clk_4f),
    .D(_000_[13]),
    .Q(data_out_8x32_Estruc[13])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _320_ (
    .C(clk_4f),
    .D(_000_[14]),
    .Q(data_out_8x32_Estruc[14])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _321_ (
    .C(clk_4f),
    .D(_000_[15]),
    .Q(data_out_8x32_Estruc[15])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _322_ (
    .C(clk_4f),
    .D(_000_[16]),
    .Q(data_out_8x32_Estruc[16])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _323_ (
    .C(clk_4f),
    .D(_000_[17]),
    .Q(data_out_8x32_Estruc[17])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _324_ (
    .C(clk_4f),
    .D(_000_[18]),
    .Q(data_out_8x32_Estruc[18])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _325_ (
    .C(clk_4f),
    .D(_000_[19]),
    .Q(data_out_8x32_Estruc[19])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _326_ (
    .C(clk_4f),
    .D(_000_[20]),
    .Q(data_out_8x32_Estruc[20])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _327_ (
    .C(clk_4f),
    .D(_000_[21]),
    .Q(data_out_8x32_Estruc[21])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _328_ (
    .C(clk_4f),
    .D(_000_[22]),
    .Q(data_out_8x32_Estruc[22])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _329_ (
    .C(clk_4f),
    .D(_000_[23]),
    .Q(data_out_8x32_Estruc[23])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _330_ (
    .C(clk_4f),
    .D(_000_[24]),
    .Q(data_out_8x32_Estruc[24])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _331_ (
    .C(clk_4f),
    .D(_000_[25]),
    .Q(data_out_8x32_Estruc[25])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _332_ (
    .C(clk_4f),
    .D(_000_[26]),
    .Q(data_out_8x32_Estruc[26])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _333_ (
    .C(clk_4f),
    .D(_000_[27]),
    .Q(data_out_8x32_Estruc[27])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _334_ (
    .C(clk_4f),
    .D(_000_[28]),
    .Q(data_out_8x32_Estruc[28])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _335_ (
    .C(clk_4f),
    .D(_000_[29]),
    .Q(data_out_8x32_Estruc[29])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _336_ (
    .C(clk_4f),
    .D(_000_[30]),
    .Q(data_out_8x32_Estruc[30])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _337_ (
    .C(clk_4f),
    .D(_000_[31]),
    .Q(data_out_8x32_Estruc[31])
  );
  (* src = "Demux_8x32_Estruc.v:17" *)
  DFF _338_ (
    .C(clk_4f),
    .D(valid_in_8x32),
    .Q(valid_out_Estruc)
  );
endmodule
