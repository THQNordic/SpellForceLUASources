-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 53.814327 , 93.688133 , 25.787050 , 12.200010 , [[Camera:ScriptSplineLookAtNpc(5536);
Camera:ScriptSplineAddTargetLookAtOffset(-1,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 54.813972 , 93.661453 , 25.787050 , 7.999995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 55.813618 , 93.634773 , 25.787050 , 12.100010 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 57.786232 , 92.581772 , 25.787050 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
