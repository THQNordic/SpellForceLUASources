-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 331.976013 , 587.889893 , 20.518696 , 4.999998 , [[Camera:ScriptSplineLookAtNpc(9304);]] )
   Camera:MotionSpline_AddSplinePoint( 332.304291 , 589.268982 , 20.518696 , 2.799999 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 332.409821 , 592.104858 , 20.518696 , 4.899998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 331.590393 , 595.338562 , 20.518696 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
