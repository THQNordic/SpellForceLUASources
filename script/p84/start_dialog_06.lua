-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 271.492004 , 213.462952 , 13.996195 , 17.900032 , [[Camera:ScriptSplineLookAtPosition(274.516,213.577,14.500);]] )
   Camera:MotionSpline_AddSplinePoint( 272.489624 , 215.855759 , 13.996195 , 12.000010 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 274.306610 , 217.319183 , 14.085220 , 17.800032 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 276.696594 , 217.914917 , 14.265221 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 18.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
