Music_Route47:
	musicheader 4, 1, Music_Route47_Ch1
	musicheader 1, 2, Music_Route47_Ch2
	musicheader 1, 3, Music_Route47_Ch3
	musicheader 1, 4, Music_Route47_Ch4

Music_Route47_Ch1:
	tempo 200
	volume $77
	dutycycle 3
	tone $0001
	vibrato $8, $15
	notetype $6, $E0
	intensity $F7
;2 measures of intro
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
	
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	octave 5
	note A_, 1
;1
	octave 4
	note A#, 4
	note __, 2
	octave 3
	note A#, 4
	note __, 2
	note A#, 4
	note __, 8
	note A#, 4
	note __, 10
	note A#, 4
	note __, 2
	note A#, 4
	note __, 6
	note A_, 10
;2
	octave 3
	note A#, 4
	note __, 2
	octave 3
	note A#, 4
	note __, 2
	note A#, 4
	note __, 8
	note A#, 4
	note __, 10
	note A#, 4
	note __, 2
	note A#, 4
	note __, 6
	note A#, 10
;3
	note A#, 6
	note A_, 6
	note G_, 4
	note A#, 6
	octave 4
	note C_, 6
	octave 3
	note A#, 4
	octave 4
	note B_, 12
	note A#, 2
	note __, 2
	note B_, 2
	note A#, 2
	note __, 4
	octave 5
	note E_, 8
	intensity $F0
Music_Route47_Ch1_loop_main:	
;4
	octave 4
	note D#, 6
	note C#, 6
	octave 3
	note B_, 4
	octave 4
	note E_, 6
	note D#, 6
	note C#, 4
	note G#, 6
	note G_, 6
	note F_, 4
	note C#, 4
	note D#, 4
	note F_, 4
	note G#, 4
;5
	notetype $c, $E0
	note B_, 16
	note A#, 16
	notetype $6, $E0
;6
	octave 3
	note G#, 8
	octave 4
	note C#, 8
	note F_, 8
	note G#, 8
	notetype $c, $E0
	note G_, 16
	notetype $6, $E0
;7
	octave 3
	note G#, 8
	octave 4
	note C#, 8
	note F_, 8
	note G#, 8
	note A#, 16
	octave 5
	note D#, 16
;8	
	octave 4
	note G_, 12
	note G_, 2
	note __, 2
	note G#, 2
	note G_, 2
	note __, 12
	note G#, 12
	note G#, 2
	note __, 2
	note B_, 2
	note A#, 4
	note __, 2
	note G#, 8
;9	
	note A#, 6
	note A_, 6
	note G_, 4
	note A#, 6
	octave 5
	note C_, 6
	octave 4
	note A#, 4
	note B_,12 
	note A#, 2
	note __, 2
	note B_, 2
	note A#, 2
	note __, 4
	octave 5
	note E_, 8
	loopchannel 0, Music_Route47_Ch1_loop_main
	

Music_Route47_Ch3:
	dutycycle 3
	intensity $F0
	notetype $6, $19
	tone $0002
	octave 2
; 2 measures of intro
	note E_, 1
	note __, 1
	note E_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note F_, 1
	note D#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note D#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note D#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note D#, 1
	note A_, 1
	note __, 1
	note A_, 1
	note D#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note D#, 1
	note C#, 2
	note D_, 2
	
;1
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
;2
	note E_, 2
	note B_, 2
	note E_, 2
	note E_, 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	note A#, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note E_, 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	note G#, 2	
;3
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
;4
	note E_, 2
	note B_, 2
	note E_, 2
	note E_, 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	note A#, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note E_, 2
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	note G#, 2		
	
;4
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2
;5	
	note B_, 12
	note A#, 2
	note __, 2
	note B_, 2
	note A#, 2
	note __, 4
	note G#, 2
	note G_, 2
	note F_, 2
	note E_, 2
Music_Route47_Ch3_loop:		
;6	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2
;7
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2
;8	
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
;9  
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2
;10
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
;11
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
;12
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2	
	note D#, 2
	note G#, 2	
	note D#, 2
	note G#, 2	
	note D#, 2
	note G#, 2	
	note D#, 2
	note G#, 2	
	note D#, 2
	note G#, 2	
	note D#, 2
	note G#, 2	
;13
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2		
;14
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
;15
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
;14
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
	note D#, 2
	note A#, 2	
;15	
	note B_, 12
	note A#, 2
	note __, 2
	note B_, 2
	note A#, 2
	note __, 4
	note G#, 2
	note G_, 2
	note F_, 2
	note E_, 2	
	loopchannel 0, Music_Route47_Ch3_loop	
Music_Route47_Ch2:
	dutycycle 3
	notetype $6, $E0
	vibrato $12, $15
	intensity $F7
	octave 4
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	
;1
	octave 4
	note D#, 4
	note __, 2
	octave 3
	note D#, 4
	note __, 2
	note D#, 4
	note __, 8	
	note D#, 4
	note __, 10
	note D#, 4
	note __, 2
	note D#, 4
	note __, 6
	note D_, 10
	
	note D#, 4
	note __, 2
	note D#, 4	
	note __, 2
	note D#, 4
	note __, 8	
	note D#, 4
	note __, 10
	note D#, 4
	note __, 2
	note D#, 4
	note __, 6
	note E_, 10
	
	intensity $F0
Music_Route47_Ch2_loop:	
;
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note D#, 1
;	
	note F_, 1
	note F#, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note F#, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
;	
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
;	
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
;	
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
;	
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
;	
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
;
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1	
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
;
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
;	
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
;	
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
;
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
;	

	note F_, 4
	note D#, 4
	note F_, 4
	note G#, 4
	note G_, 6,
	note F_, 6
	note G#, 4
;
	octave 4
	note C_, 16
	octave 3
	note A#, 16
;	
	note F_, 4
	note D#, 4
	note F_, 4
	note G#, 4
	note A#, 6
	octave 4
	note C_, 6
	note D_, 4
;	
	note D#, 16
	note A#, 16
;
	octave 3
	note D#, 12
	note D#, 2
	note __, 2
	note F_, 2
	note D#, 2
	note __, 12
;	
	note E_, 12
	note E_, 2
	note __, 2
	note G#, 2
	note F#, 4
	note __, 2
	note E_, 8
	loopchannel 0, Music_Route47_Ch2_loop
	
Music_Route47_Ch4:
	togglenoise $3
	notetype $c
Music_Route47_Ch4_loop_main:
	note __, 8
	loopchannel 0, Music_Route47_Ch4_loop_main
	
