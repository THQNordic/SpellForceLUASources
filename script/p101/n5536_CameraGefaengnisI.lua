-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 338.037994 , 201.335632 , 46.574982 , 110.398888 , [[Camera:ScriptSplineLookAtPosition(362.496,174.277,34.490);]] )
   Camera:MotionSpline_AddSplinePoint( 334.154022 , 193.833435 , 45.634617 , 57.599693 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 331.263580 , 189.882538 , 43.516644 , 110.298889 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 326.447449 , 178.653854 , 38.354965 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 110.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
