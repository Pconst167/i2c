module i2c_master(
  input  logic    arst,
  input  logic    ck,

  output logic    scl,
  input  logic    sdai,
  output logic    sdao

);

  typedef enum{
    IDLE_ST,
    START_ST,
    READ_ADDRESS_ST,
    WRITING_ST,
    READING_ST,
    STOP_ST
  } t_i2cStates;

  t_i2cStates currStateI2cFsm;
  t_i2cStates nextStateI2cFsm;

  logic placeHolderOutput;

  logic eventStartCondDetected;
  logic eventStopCondDetected;

  logic [7:0] deviceAddress;
  logic [7:0] registerAddress;
  logic [7:0] data;

  always_comb begin
    case(currStateI2cFsm)
      IDLE_ST:
        if(eventStartCondDetected) nextStateI2cFsm = START_ST;
      START_ST:
        nextStateI2cFsm = IDLE_ST;

      WRITING_ST:
        nextStateI2cFsm = IDLE_ST;

      READING_ST:
        nextStateI2cFsm = IDLE_ST;

      STOP_ST:
        nextStateI2cFsm = IDLE_ST;

      default:
        nextStateI2cFsm = IDLE_ST;
    endcase
  end

  always_ff @(posedge ck, posedge arst) begin
    if(arst) begin
      placeHolderOutput <= '0;
    end
    else case(currStateI2cFsm)
      IDLE_ST: begin
        placeHolderOutput <= '0;
      end
      START_ST: begin
        placeHolderOutput <= '0;
      end
      WRITING_ST: begin
        placeHolderOutput <= '0;
      end
      READING_ST: begin
        placeHolderOutput <= '0;
      end
      STOP_ST: begin
        placeHolderOutput <= '0;
      end
    endcase
  end

  always_ff @(posedge ck, posedge arst) begin
    if(arst) currStateI2cFsm <= IDLE_ST;
    else currStateI2cFsm <= nextStateI2cFsm;
  end



endmodule
