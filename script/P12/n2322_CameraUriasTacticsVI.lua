-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 498.161011 , 642.702576 , 30.676964 , 29.800077 , [[Camera:ScriptSplineLookAtPosition(506.330,642.394,29.000);]] )
   Camera:MotionSpline_AddSplinePoint( 498.361542 , 640.329773 , 30.557297 , 18.400034 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 499.082123 , 638.098206 , 30.616966 , 29.700077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 500.746307 , 635.667664 , 30.556961 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(507.482,640.188,32.920);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
