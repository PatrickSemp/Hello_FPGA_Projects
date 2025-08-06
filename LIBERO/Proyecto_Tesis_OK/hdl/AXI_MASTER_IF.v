///////////////////////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------------
//-- Title      : AXI Master Interface
//-------------------------------------------------------------------------------
//-- File       : AXI_IF.v
//-- Author     : Corporate Applications Engineering
//-- Company    : Microsemi Corporation
//-- Device     : SmartFusion2
//-- Standard   : Verilog
//-------------------------------------------------------------------------------
//-- Description: This code implementes the AXI master logic to write the data to  
//--              FDDR through DDR_FIC and does 64bit burst transactions.
//-------------------------------------------------------------------------------
//-- Copyright (c) 2013   Microsemi Corporation
//--                      All rights reserved.
//-------------------------------------------------------------------------------
//-- Revisions  : V1.0
//-------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////////// 

module AXI_MASTER_IF(
	//input DRAM_Ready,
	input 				ACLK,
	input 				ARESETN,

	input 				WRITE,
	input		[31:0]	WRITE_ADDRESS,
	input		[63:0]	DATA_IN,
    output	reg			Next_DATA_IN, //when next data is sampled
	input				READ,
	input		[31:0]	READ_ADDRESS,

	input		[3:0]	WLEN,                  //  write Burst length 
	input		[3:0]	RLEN,                  //  read Burst length 
	output	reg			AXI_WC_BUSY,	
	output	reg			AXI_RC_BUSY,

  	// Write Address Channel (WAC)
	output		[3:0]   AWID, 
	output	reg [31:0]  AWADDR, 
  	output  	[3:0]   AWLEN, 
  	output reg 	[2:0]   AWSIZE, 
  	output  	[1:0]   AWLOCK,  
  	output reg 	[1:0]   AWBURST, 
  	output reg          AWVALID,  
  	input               AWREADY,  
  	// Write Data Channel (RDC)
  	output  [3:0]       WID, 
  	output reg [7:0]    WSTRB,
  	output reg          WLAST,
  	output reg          WVALID,
  	output reg [63:0]   WDATA, 
  	input               WREADY, 	
  	// Write Response Channel (WRC)
 	input [3:0]         BID,
	input [1:0]         BRESP,  
	input               BVALID,	
	output reg          BREADY,
  // Read Address Channel (RAC)
	output [3:0]        ARID, 
	output reg [31:0]   ARADDR, 
	output 		[3:0]    ARLEN, 
  	output reg [1:0]    ARSIZE, 
  	output  [1:0]    ARLOCK, 
  	output reg [1:0]    ARBURST, 
  	output reg          ARVALID, 
  	input               ARREADY, 
  // Read Data Channel (RDC)
  	input [3:0]         RID,
  	input [63:0]        RDATA, 
  	input [1:0]         RRESP,
  	input               RLAST,
  	input               RVALID,
  	output reg          RREADY);

// AXI FSM States
reg [2:0] axi_fsm_write_state;
parameter [2:0] Idle_0 = 3'b000, Idle_1 = 3'b001, Write_0 = 3'b010, Write_1 = 3'b011, Write_2 = 3'b100, Bresp_0 = 3'b101;
reg [1:0] axi_fsm_read_state;
parameter [1:0] Read_0 = 2'b00, Read_1 = 2'b01, Read_2 = 2'b10, Read_3 = 2'b11;

////////////////////////////
reg [3:0] w_tr_length,r_tr_length;

////////////////////////////

assign AWLEN  = WLEN;
assign AWLOCK = 2'b00;
assign AWID  = 4'b0000;
assign WID = 4'b0000;
assign ARLEN  = RLEN;
assign ARLOCK = 2'b00;
assign ARID  = 4'b0000;


always@(posedge ACLK, negedge ARESETN)
begin	
	if(ARESETN == 1'b0 )
		begin
		 AWSIZE 		<= 3'b000; 
		 AWBURST        <= 2'b01;
		 AWVALID 		<= 1'b0;                    
		 WSTRB  		<= 8'h00;
		 WVALID 		<= 1'b0;
		 WLAST 			<= 1'b0;                
		 WSTRB  		<= 8'h00;
		 
		 AXI_WC_BUSY	<= 1'b1;
		 axi_fsm_write_state   <=  Idle_0;
         w_tr_length    <= 4'b0000;
		 Next_DATA_IN		<= 1'b0;     
		end
	else
		begin
			case (axi_fsm_write_state)
			  Idle_0:
				begin
				  AXI_WC_BUSY				<= 1'b0;
				  axi_fsm_write_state   	<= Idle_1;
				  w_tr_length      			<= 4'b0000;                          
				end
			  Idle_1:
				begin
				  BREADY 					<= 1'b0;
				  w_tr_length     			<= 4'b0000;  
				  if ( WRITE == 1'b1)
					begin
					  AWSIZE 				<= 3'b011;
					  AWBURST 				<= 2'b01;
					  AWADDR 				<= WRITE_ADDRESS;
					  AWVALID 				<= 1'b1;
					  AXI_WC_BUSY			<= 1'b1;
					  axi_fsm_write_state   <= Write_0;
					end
				  else
					begin
					  axi_fsm_write_state   <= Idle_1;
					end
			    end
			  Write_0:
				begin
				  if (AWREADY == 1'b1)
					 begin
						AWVALID 				<= 1'b0;				
						axi_fsm_write_state   	<= Write_1;
                        WDATA  					<= DATA_IN;                     
                        WSTRB  					<= 8'hFF;
                        WVALID 					<= 1'b1;
                        if(w_tr_length == WLEN)
                           begin
                              WLAST  			<= 1'b1;
                           end
					 end
				    else
					  begin
						axi_fsm_write_state   	<= Write_0;
					  end
				end

			  Write_1:
				begin
				  if (WREADY == 1'b1)                                               
					begin
				      WVALID 					<= 1'b0;
					  Next_DATA_IN					<= 1'b0; 				 
						if(w_tr_length == WLEN)
							begin
                      			axi_fsm_write_state <= Bresp_0;
								WLAST  				<= 1'b0;
							end
						else
							begin
						 		axi_fsm_write_state <= Write_2;
						 		AXI_WC_BUSY			<= 1'b1;
								w_tr_length     	<= w_tr_length +1'b1;
								Next_DATA_IN			<= 1'b1;
						end
			
					end
				  else
					begin
					  axi_fsm_write_state   <= Write_1;
			 		end
			    end
			 
			Write_2:
				begin
				  WDATA  					<= DATA_IN;                     
				  WSTRB  					<= 8'hFF;
				  WVALID 					<= 1'b1;
				  axi_fsm_write_state   	<= Write_1;
				  Next_DATA_IN					<= 1'b0;
					if(w_tr_length == WLEN)
                    	begin
						WLAST  				<= 1'b1;
						end
					else
						begin							
						WLAST  				<= 1'b0;
						end					 
				end
 
			 Bresp_0:
				begin
				  if (BVALID == 1'b1)
					begin
					  BREADY 				<= 1'b1;
					  AXI_WC_BUSY			<= 1'b0;		 				 		
					  axi_fsm_write_state   <= Idle_1;
					end
				  else
					begin
					  axi_fsm_write_state   <=  Bresp_0;
					end
				end		
			
			endcase
	end
end

always@(posedge ACLK, negedge ARESETN)
begin	
	if(ARESETN == 1'b0 )
		begin
		 ARSIZE 		<= 3'b000;		 
		 ARBURST 		<= 2'b01;
		 ARSIZE 		<= 3'b000; 
		 ARVALID 		<= 1'b0; 
		 RREADY 		<= 1'b0;                   
	
		 AXI_RC_BUSY    <= 1'b0;
		 axi_fsm_read_state   <=  Read_0;
		 r_tr_length    <= 4'b0000; 
		end
	else
		begin
			case (axi_fsm_read_state)
			Read_0:
			begin
				AXI_RC_BUSY	<= 1'b0;
				ARVALID 	<= 1'b0;
				RREADY 		<= 1'b0;
				r_tr_length <= 4'b0000;
				if (READ == 1'b1)
					axi_fsm_read_state  <= Read_1;
				else
					axi_fsm_read_state  <= Read_0;
			end

			Read_1:
			begin
				ARSIZE 		<= 3'b011;
				ARBURST 	<= 2'b01;
				ARADDR 		<= READ_ADDRESS;
				AXI_RC_BUSY	<= 1'b1;
				RREADY 		<= 1'b0;
				ARVALID 	<= 1'b1;
                axi_fsm_read_state   <= Read_2;

			end

			Read_2:
			begin
                if (ARREADY == 1'b1)
				begin
					ARVALID <= 1'b0;
                    RREADY <= 1'b1;
                    axi_fsm_read_state   <= Read_3;
				end
				else
				begin
					axi_fsm_read_state   <= Read_2;
				end
			end

			Read_3:
			begin
				if ((RVALID == 1'b1) && (r_tr_length == RLEN))
				begin
					axi_fsm_read_state   	<= Read_0;
					AXI_RC_BUSY				<= 1'b0;
					RREADY 					<= 1'b0;			
				end
				else if ((RVALID == 1'b1) && (r_tr_length != RLEN))
				begin
					r_tr_length 			<= r_tr_length + 1'b1;
					axi_fsm_read_state   	<= Read_3;
				end
				else 
				begin
					axi_fsm_read_state   	<= Read_3;
				end
			end
			
			endcase
	end
end


endmodule