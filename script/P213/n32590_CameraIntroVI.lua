-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 643.570068 , 337.642365 , 49.923325 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(644.042,351.899,55.000);]] )
   Camera:MotionSpline_AddSplinePoint( 643.570068 , 337.642365 , 49.923325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 643.570068 , 337.642365 , 49.923325 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 643.570068 , 337.642365 , 49.923325 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 7.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
