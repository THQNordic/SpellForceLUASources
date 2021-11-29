-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 381.954346 , 366.334778 , 32.499928 , 11.900009 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 382.371216 , 382.236542 , 36.127075 , 6.699996 , [[Camera:ScriptSplineLookAtNpc(8794);]] )
   Camera:MotionSpline_AddSplinePoint( 382.337219 , 407.757843 , 69.577080 , 8.099995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 382.203644 , 418.522064 , 70.197014 , 10.000002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 381.731537 , 425.760834 , 68.467064 , 10.700005 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 380.654602 , 429.010986 , 64.860680 , 11.000006 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 378.037292 , 431.608093 , 63.229332 , 11.400007 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 376.467194 , 435.728455 , 61.685425 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 375.825775 , 439.327179 , 60.900055 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 375.445587 , 442.137268 , 60.600319 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 375.984283 , 444.858063 , 60.600296 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.898438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
