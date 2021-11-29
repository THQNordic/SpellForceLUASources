-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 152.203033 , 462.355255 , 49.659016 , 14.900021 , [[Camera:ScriptSplineLookAtPosition(146.974,438.279,31.940);]] )
   Camera:MotionSpline_AddSplinePoint( 129.571869 , 479.693878 , 50.069008 , 13.400015 , [[Camera:ScriptSplineLookAtPosition(116.286,456.633,33.000);
Camera:ScriptSplineLookAtApproachingModifier(0.1);]] )
   Camera:MotionSpline_AddSplinePoint( 114.417976 , 486.292297 , 50.159016 , 14.800020 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 98.558456 , 488.981628 , 50.179020 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
