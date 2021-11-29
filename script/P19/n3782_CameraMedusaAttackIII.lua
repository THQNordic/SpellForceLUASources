-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 304.973450 , 64.703278 , 57.336174 , 13.800016 , [[Camera:ScriptSplineLookAtNpc(4190);]] )
   Camera:MotionSpline_AddSplinePoint( 304.973450 , 64.703278 , 53.336174 , 9.099998 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 304.973450 , 64.703278 , 53.336174 , 13.700016 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 304.973450 , 64.703278 , 53.336174 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
