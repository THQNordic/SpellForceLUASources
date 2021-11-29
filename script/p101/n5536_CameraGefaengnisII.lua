-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 465.003052 , 291.484894 , 51.070145 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(503.313,345.516,23.720);]] )
   Camera:MotionSpline_AddSplinePoint( 474.877930 , 280.575409 , 56.320118 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 489.950562 , 277.259369 , 56.763836 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 513.200623 , 283.143066 , 51.230225 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 40.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
