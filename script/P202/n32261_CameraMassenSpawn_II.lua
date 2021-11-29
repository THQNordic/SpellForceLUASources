-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 539.568359 , 374.292908 , 63.128384 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(561.109,406.842,53.745);]] )
   Camera:MotionSpline_AddSplinePoint( 525.911438 , 386.135376 , 63.488110 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 518.001709 , 397.680359 , 64.008102 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 512.843140 , 410.685150 , 64.638374 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
