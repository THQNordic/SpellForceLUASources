-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 449.221100 , 532.522217 , 34.901398 , 45.099884 , [[Camera:ScriptSplineLookAtPosition(477.189,574.507,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 427.483887 , 550.329590 , 35.917667 , 16.000025 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 440.455200 , 589.060181 , 40.298885 , 28.900074 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 491.574219 , 613.244690 , 41.268929 , 38.599983 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 523.412170 , 587.471191 , 39.878929 , 44.999886 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 505.781830 , 567.321533 , 34.849113 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 45.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
