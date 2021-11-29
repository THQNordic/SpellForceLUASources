-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 329.191925 , 586.620605 , 16.907116 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9304);]] )
   Camera:MotionSpline_AddSplinePoint( 330.369476 , 589.555542 , 16.907116 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 330.489044 , 591.552002 , 16.907116 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 329.670197 , 594.606445 , 16.907116 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 5.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
