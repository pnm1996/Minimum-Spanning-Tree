set ns [new Simulator]

#set tr [ open out.tr w]
#$ns trace-all $tr

set namtr [open out.nam w]
$ns namtrace-all $namtr

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]
set n7 [$ns node]
set n8 [$ns node]

$ns duplex-link $n0 $n1 10Mb 5ms DropTail
$ns duplex-link $n1 $n2 10Mb 5ms DropTail
$ns duplex-link $n2 $n3 10Mb 5ms DropTail
$ns duplex-link $n3 $n4 10Mb 5ms DropTail
$ns duplex-link $n4 $n5 10Mb 5ms DropTail
$ns duplex-link $n5 $n6 10Mb 5ms DropTail
$ns duplex-link $n6 $n7 10Mb 5ms DropTail
$ns duplex-link $n7 $n8 10Mb 5ms DropTail
$ns duplex-link $n1 $n7 10Mb 5ms DropTail
$ns duplex-link $n2 $n8 10Mb 5ms DropTail
$ns duplex-link $n8 $n6 10Mb 5ms DropTail
$ns duplex-link $n2 $n5 10Mb 5ms DropTail
$ns duplex-link $n3 $n5 10Mb 5ms DropTail
$ns duplex-link $n0 $n7 10Mb 5ms DropTail

$ns duplex-link-op $n1 $n0 orient left-down
$ns duplex-link-op $n2 $n1 orient left
$ns duplex-link-op $n3 $n2 orient left
$ns duplex-link-op $n4 $n3 orient left-up
$ns duplex-link-op $n5 $n4 orient right-up
$ns duplex-link-op $n6 $n5 orient right
$ns duplex-link-op $n6 $n7 orient left
$ns duplex-link-op $n7 $n8 orient right-up
$ns duplex-link-op $n1 $n7 orient down
$ns duplex-link-op $n2 $n8 orient down
$ns duplex-link-op $n8 $n6 orient down
$ns duplex-link-op $n2 $n5 orient right-down
$ns duplex-link-op $n3 $n5 orient down


set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0 

set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1

set udp2 [new Agent/UDP]
$ns attach-agent $n2 $udp2

set udp21 [new Agent/UDP]
$ns attach-agent $n2 $udp21

set udp22 [new Agent/UDP]
$ns attach-agent $n2 $udp22

set udp3 [new Agent/UDP]
$ns attach-agent $n3 $udp3 

set udp5 [new Agent/UDP]
$ns attach-agent $n5 $udp5 

set udp6 [new Agent/UDP]
$ns attach-agent $n6 $udp6 

set null1 [new Agent/Null]
$ns attach-agent $n1 $null1 

set null2 [new Agent/Null]
$ns attach-agent $n2 $null2 

set null3 [new Agent/Null]
$ns attach-agent $n3 $null3 

set null4 [new Agent/Null]
$ns attach-agent $n4 $null4 

set null5 [new Agent/Null]
$ns attach-agent $n5 $null5 

set null6 [new Agent/Null]
$ns attach-agent $n6 $null6

set null7 [new Agent/Null]
$ns attach-agent $n7 $null7

set null8 [new Agent/Null]
$ns attach-agent $n8 $null8 

 
$ns connect $udp0 $null1
$ns connect $udp1 $null2
$ns connect $udp2 $null8
$ns connect $udp21 $null5
$ns connect $udp22 $null3
$ns connect $udp3 $null4
$ns connect $udp5 $null6
$ns connect $udp6 $null7

set cbr0 [new Application/Traffic/CBR]
set cbr1 [new Application/Traffic/CBR]
set cbr2 [new Application/Traffic/CBR]
set cbr21 [new Application/Traffic/CBR]
set cbr22 [new Application/Traffic/CBR]
set cbr3 [new Application/Traffic/CBR]
set cbr5 [new Application/Traffic/CBR]
set cbr6 [new Application/Traffic/CBR]

$cbr0 attach-agent $udp0
$cbr1 attach-agent $udp1
$cbr2 attach-agent $udp2
$cbr21 attach-agent $udp21
$cbr22 attach-agent $udp22
$cbr3 attach-agent $udp3
$cbr5 attach-agent $udp5
$cbr6 attach-agent $udp6

$ns at 0.1 "$cbr0 start"
$ns at 0.15 "$cbr1 start"
$ns at 0.2 "$cbr2 start"
$ns at 0.2 "$cbr21 start"
$ns at 0.2 "$cbr22 start"
$ns at 0.25 "$cbr3 start"
$ns at 0.3 "$cbr5 start"
$ns at 0.35 "$cbr6 start"

$ns at 0.15 "$cbr0 stop"
$ns at 0.2 "$cbr1 stop"
$ns at 0.25 "$cbr2 stop"
$ns at 0.25 "$cbr21 stop"
$ns at 0.25 "$cbr22 stop"
$ns at 0.3 "$cbr3 stop"
$ns at 0.35 "$cbr5 stop"
$ns at 0.4 "$cbr6 stop"

$ns at 0.5 "$ns halt"
$ns run
$ns at 5.0 "$ns halt"
$ns run

