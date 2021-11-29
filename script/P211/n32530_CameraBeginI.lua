-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 341.602020 , 325.736115 , 58.834244 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(397.389,434.048,50.002);]] )
   Camera:MotionSpline_AddSplinePoint( 369.282471 , 318.448181 , 58.834244 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 399.929779 , 315.666962 , 58.834244 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 435.188873 , 320.975647 , 58.834244 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 2.929688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
